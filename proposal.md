# Sysroot Support in Swift’s build-script

**Motivation**

The common approach to building Swift for Linux is native compilation, where
the host and target are identical. Cross-compilation lets the host stay the
same while using different sysroots for multiple target distributions, enabling
builds without leaving the host system. This clearly separates the host
compiler, Swift runtime libraries, and target system interface, improving
modularity and design. It also allows targeting environments where native
builds are impractical, such as minimal, constrained, older, or specialized
distributions. This project builds on existing Wasm cross-compilation
mechanisms generalizing sysroot support in `build-script`. It enables support
for more targets and strengthens the extensibility and sustainability of
Swift’s build infrastructure.

**Description**

Extend Swift‘s `build-script` with an experimental flag which
provides the path to the sysroot of the target triple. This enables
[cross-compiling](https://github.com/swiftlang/swift-evolution/blob/main/proposals/0387-cross-compilation-destinations.md)
to other sysroots, meaning the host triple is different to the target triple.
[Wasm](https://github.com/swiftlang/swift/blob/main/utils/swift_build_support/swift_build_support/products/wasmswiftsdk.py)
already uses a [sysroot](https://github.com/swiftlang/swift/blob/main/utils/swift_build_support/swift_build_support/products/wasisysroot.py).
The approach is to generalize the mechanism by splitting out the Swift core library builds into separate build products to be used for cross-compiling.


**Expected outcomes/benefits/deliverables**
- New build products for cross-compiling Swift core libraries (reuse from Wasm).
- The new experimental flag from `build-script` is propagated to the new build products.
- Cross-compilation succeeds and tests run successfully on target system.
- Benefit is to be able to cross-compile to various Linux distros from one host system.
    It enables generation of Swift SDKs for cross-compilation.


**Potential mentors**

- [Max Desiatov](https://github.com/MaxDesiatov)


**Timeline**

*General thoughts about [Google's Timeline](https://developers.google.com/open-source/gsoc/timeline)*

For a standard 12 week coding project, which 75% of the projects are, it is targeted to be 175 hours long.

Start date: May 25  
Midterm evaluation deadline: July 10  
End date: August 24  

The timeline is set out, so a major milestone is delivered latest July 10.

*Major Milestones*
- define design of new build products and its contents, define what is wasm specific to be passed through and what is generally needed for cross compilation
- split out build products and make wasm use it, delete unused wasm parts that are now generalized
- introduce experimental flag passing sysroot, test with wasm by explicitly setting sysroot in new build product, instead of passing through implicitly
- establish mechanism to execute entire swift compiler test suite on freshly cross-compiled swift

midterm July 10

- define host and target triples for cross compilation to be supported and tested on
- for each Swift core library in the new build products, cross compile it to another Linux distro passing sysroot, test on target system ensuring tests pass
- test with more target triples

