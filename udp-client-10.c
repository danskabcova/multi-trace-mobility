#include "contiki.h"
#include "net/rime/rime.h"
#include "random.h"
#include "sys/etimer.h"
#include "lib/list.h"
#include "lib/memb.h"
#include "shell.h"
#include <stdio.h>
#include <string.h>

#define ATTACK_INTERVAL (15 * 60 * CLOCK_SECOND)  // 15 minutes
#define ATTACK_DURATION (10 * 60 * CLOCK_SECOND)  // 10 minutes on, 10 minutes off
#define TOTAL_ATTACK_DURATION (300 * 60 * CLOCK_SECOND)  // 300 minutes total

static struct etimer attack_timer;
static struct etimer attack_duration_timer;
static int attack_active = 0;
static int attack_started = 0;
static int is_attacker = 0;  // Flag to determine if the node is malicious
static struct etimer total_attack_timer;

PROCESS(udp_client_process, "UDP client process");
AUTOSTART_PROCESSES(&udp_client_process);

static void
broadcast_recv(struct broadcast_conn *c, const linkaddr_t *from)
{
  if (is_attacker && attack_active) {
    // Blackhole attack: Do nothing (drop the packet)
  } else {
    printf("Broadcast message received from %d.%d: '%s'\n",
           from->u8[0], from->u8[1], (char *)packetbuf_dataptr());
  }
}

static const struct broadcast_callbacks broadcast_call = {broadcast_recv};
static struct broadcast_conn broadcast;

static PT_THREAD(cmd_attack(struct pt *pt, shell_output_func output, char *args))
{
  PT_BEGIN(pt);
  SHELL_OUTPUT(output, "SINK HOLE ATTACK IS STARTED!\n");
  attack_active = 1;
  PT_END(pt);
}

static PT_THREAD(cmd_stop_attack(struct pt *pt, shell_output_func output, char *args))
{
  PT_BEGIN(pt);
  SHELL_OUTPUT(output, "SINK HOLE ATTACK IS FINISHED!\n");
  attack_active = 0;
  PT_END(pt);
}

static const struct shell_command_t client_commands[] = {
  { "attack", cmd_attack, "'> attack': Sets the node in attack mode." },
  { "stop-attack", cmd_stop_attack, "'> stop-attack': Sets the node in non-attack mode." },
  { NULL, NULL, NULL },
};

static struct shell_command_set_t client_shell_command_set = {
  .next = NULL,
  .commands = client_commands,
};

PROCESS_THREAD(udp_client_process, ev, data)
{
  PROCESS_EXITHANDLER(broadcast_close(&broadcast);)

  PROCESS_BEGIN();

  broadcast_open(&broadcast, 129, &broadcast_call);
  shell_register_command_set(&client_shell_command_set);

  if (random_rand() % 2 == 0) {  // Random condition for demonstration
    is_attacker = 1;
    etimer_set(&attack_timer, ATTACK_INTERVAL);
    etimer_set(&total_attack_timer, TOTAL_ATTACK_DURATION);
  }

  while (1) {
    PROCESS_WAIT_EVENT();

    if (is_attacker && !attack_started && etimer_expired(&attack_timer)) {
      attack_started = 1;
      process_start(&cmd_attack_process, NULL);
      etimer_set(&attack_duration_timer, ATTACK_DURATION);
    }

    if (is_attacker && attack_started && etimer_expired(&attack_duration_timer)) {
      if (attack_active) {
        process_start(&cmd_stop_attack_process, NULL);
      } else {
        process_start(&cmd_attack_process, NULL);
      }
      etimer_reset(&attack_duration_timer);
    }

    if (is_attacker && etimer_expired(&total_attack_timer)) {
      process_start(&cmd_stop_attack_process, NULL);
      attack_started = 0;
      is_attacker = 0;
      printf("Total attack duration finished.\n");
    }
  }

  PROCESS_END();
}

     * Update all energest times. Should always be called before energest
     * times are read.
     */
    energest_flush();

    printf("\nEnergest:\n");
    printf(" CPU          %4lus LPM      %4lus DEEP LPM %4lus  Total time %lus\n",
           to_seconds(energest_type_time(ENERGEST_TYPE_CPU)),
           to_seconds(energest_type_time(ENERGEST_TYPE_LPM)),
           to_seconds(energest_type_time(ENERGEST_TYPE_DEEP_LPM)),
           to_seconds(ENERGEST_GET_TOTAL_TIME()));
    printf(" Radio LISTEN %4lus TRANSMIT %4lus OFF      %4lus\n",
           to_seconds(energest_type_time(ENERGEST_TYPE_LISTEN)),
           to_seconds(energest_type_time(ENERGEST_TYPE_TRANSMIT)),
           to_seconds(ENERGEST_GET_TOTAL_TIME()
                      - energest_type_time(ENERGEST_TYPE_TRANSMIT)
                      - energest_type_time(ENERGEST_TYPE_LISTEN)));
#endif /* SHOW_ENERGEST */
  }

  PROCESS_END();
}
/*---------------------------------------------------------------------------*/
