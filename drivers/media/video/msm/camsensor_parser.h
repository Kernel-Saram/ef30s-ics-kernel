#ifndef CAMSENSOR_PARSER_H
#define CAMSENSOR_PARSER_H
#include <linux/types.h>
#include <media/msm_camera.h>

typedef struct {
  u_int16_t address;
  u_int16_t value;
} camsensor_parser_register_t;


extern u_int32_t camsensor_reg_file_read (const int8_t *filename, u_int32_t register_set_size, camsensor_parser_register_t *register_set);


extern u_int8_t * camsensor_parser_find_addr (u_int8_t *fpage, u_int16_t *address);

extern u_int8_t * camsensor_parser_find_data (u_int8_t *fpage, u_int16_t *value);

extern int8_t * camsensor_parser_find_line (u_int8_t *str);

#endif /* CAMSENSOR_PARSER_H */

