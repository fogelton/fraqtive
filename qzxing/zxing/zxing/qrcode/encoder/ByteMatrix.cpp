#include "ByteMatrix.h"
#include <sstream>

namespace zxing {
namespace qrcode {

ByteMatrix::ByteMatrix(size_t width, size_t height) :
    width_(width), height_(height)
{
    bytes_.resize(height_);
    for(size_t i=0; i<height; i++)
        bytes_[i].resize(width);
}

size_t ByteMatrix::getHeight() const
{
    return height_;
}

size_t ByteMatrix::getWidth() const
{
    return width_;
}

char ByteMatrix::get(size_t x, size_t y) const
{
    return bytes_[y][x];
}

std::vector< std::vector<char> > ByteMatrix::getArray() const
{
    return bytes_;
}

void ByteMatrix::set(size_t x, size_t y, const char value)
{
    bytes_[y][x] = value;
}

void ByteMatrix::set(size_t x, size_t y, size_t value)
{
    bytes_[y][x] = (char) value;
}

void ByteMatrix::set(size_t x, size_t y, bool value)
{
    bytes_[y][x] = (char) (value ? 1 : 0);
}

void ByteMatrix::clear(const char value)
{
    for (size_t y = 0; y < height_; y++) {
        for (size_t x = 0; x < width_; x++) {
            bytes_[y][x] = value;
        }
    }
}

const std::string ByteMatrix::toString() const
{
    std::stringstream result;// = new StringBuilder(2 * width * height + 2);
    for (size_t y = 0; y < height_; y++) {
        for (size_t x = 0; x < width_; x++) {
            switch (bytes_[y][x]) {
            case 0:
                result << " 0";
                break;
            case 1:
                result << " 1";
                break;
            default:
                result << "  ";
                break;
            }
        }
        result << '\n' ;
    }
    return result.str();
}

}
}
