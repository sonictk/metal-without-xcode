default: main shaders.metallib

main: main.mm common.h
	clang++ -std=c++11 -O0 -g -framework Cocoa -framework Metal -framework MetalKit -fobjc-arc $< -o $@

%.air: %.metal common.h
	xcrun -sdk macosx metal -c -o $@ $<

%.metal-ar: %.air
	xcrun -sdk macosx metal-ar r $@ $<

%.metallib: %.metal-ar
	xcrun -sdk macosx metallib -o $@ $<

clean:
	rm -f main *.metallib *.metal-ar *.air
