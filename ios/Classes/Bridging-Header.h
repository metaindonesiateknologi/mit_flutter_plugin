#ifndef Bridging_Header_h
#define Bridging_Header_h

char *search_address_by_name(const char *text, const char *lat, const char *lon, const char *appid, const char *token);
char *search_address_by_coord(const char *lat, const char *lon, const char *appid, const char *token);
char *map_route(const char *start, const char *start_lat, const char *start_lon, const char *dest, const char *dest_lat, const char *dest_lon, const char *appid, const char *token);
void free_string(char *ptr);

#endif /* Bridging_Header_h */
