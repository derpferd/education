/* Trivial libtrace program that prints a count of the number of packets
 * observed every 10 seconds in a trace.
 * Designed to demonstrate the use of trace_get_timeval()
 */
#include "libtrace.h"
#include <stdio.h>
#include <inttypes.h>
#include <assert.h>
#include <getopt.h>

uint64_t count = 0;
uint32_t next_report = 0;

static void per_packet(libtrace_packet_t *packet)
{
	struct timeval ts;
	
	/* Get the timestamp for the current packet */
	ts = trace_get_timeval(packet);

	/* If next_report is zero, then this is the first packet from the
	 * trace so we need to determine the time at which the first report
	 * must occur, i.e. 10 seconds from now. */
	if (next_report == 0) {
		next_report = ts.tv_sec + 10;

		/* This is also a good opportunity to print column headings */
		printf("Time\t\tPackets\n");
	}

	/* Check whether we need to report a packet count or not.
	 *
	 * If the timestamp for the current packet is beyond the time when the
	 * next report was due then we have to output our current count and
	 * reset it to zero.
	 *
	 * Note that I use a while loop here to ensure that we correctly deal
	 * with periods in which no packets are observed.
	 */
	while ((uint32_t)ts.tv_sec > next_report) {
		/* Print a timestamp for the report and the packet count */
		printf("%u \t%" PRIu64 "\n", next_report, count);
		/* Reset the counter */
		count = 0;
		/* Determine when the next report is due */
		next_report += 10;
	}

	/* No matter what else happens during this function call, we still
	 * need to increment our counter */	
	count += 1;
}

/* Due to the amount of error checking required in our main function, it
 * is a lot simpler and tidier to place all the calls to various libtrace
 * destroy functions into a separate function.
 */
static void libtrace_cleanup(libtrace_t *trace, libtrace_packet_t *packet) {
	
	/* It's very important to ensure that we aren't trying to destroy
         * a NULL structure, so each of the destroy calls will only occur
         * if the structure exists */
	if (trace)
		trace_destroy(trace);

	if (packet)
		trace_destroy_packet(packet);

}

int main(int argc, char *argv[])
{
	/* This is essentially the same main function from readdemo.c */
	
	libtrace_t *trace = NULL;
	libtrace_packet_t *packet = NULL;
	
	/* Ensure we have at least one argument after the program name */
        if (argc < 2) {
                fprintf(stderr, "Usage: %s inputURI\n", argv[0]);
                return 1;
        }	

	packet = trace_create_packet();

	if (packet == NULL) {
		perror("Creating libtrace packet");
		libtrace_cleanup(trace, packet);
		return 1;
	}

	trace = trace_create(argv[1]);

	if (trace_is_err(trace)) {
		trace_perror(trace,"Opening trace file");
		libtrace_cleanup(trace, packet);
		return 1;
	}

	if (trace_start(trace) == -1) {
		trace_perror(trace,"Starting trace");
		libtrace_cleanup(trace, packet);
		return 1;
	}


	while (trace_read_packet(trace,packet)>0) {
		per_packet(packet);
	}


	if (trace_is_err(trace)) {
		trace_perror(trace,"Reading packets");
		libtrace_cleanup(trace, packet);
		return 1;
	}

	printf("%u \t%" PRIu64 "\n", next_report, count);

	libtrace_cleanup(trace, packet);
	return 0;
}
