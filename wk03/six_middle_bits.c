/**
 * We have 32 bits, and we want to get the middle 6 bits.
 * 
 * 0101 ... 111100 ... 0111 >> 13
 * 0000 0101 1010 1111 111100 & 0x3F -> 0011 1111
 * 0000 0000 0000 0000 111100
 * 
 */
uint32_t six_middle_bits(uint32_t u) {
    // int shifted_value = u >> 13;
    // int six_bits = shifted_value & 0x3F;
    // return six_bits;
    return (u >> 13) & 0x3F;
    return (u << 13) >> 26;
}