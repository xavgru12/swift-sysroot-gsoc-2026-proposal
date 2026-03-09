# Sysroot Support in Swift’s build-script

**Personal**

Name: Xaver Gruber  
Email: xaver.max.gruber@gmail.com  
Github: https://github.com/xavgru12  
Linkedin: linkedin.com/in/ingenieur-xaver-gruber-639a4b18a  
Degree Program: Final year of MSc in Computer Science at IU  
Job: Embedded Software Engineer  
Country: Switzerland  
 
I am experienced in developing and maintaining build systems with CMake and Python.
I have been following the Swift project closely, with a particular interest in cross-compiling Swift where I have built [good connections](https://xtremekforever.substack.com/p/introduction-to-building-swift-for) within the community.

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

<div style="page-break-after: always;"></div>

**Timeline**

Start date: May 25  
Midterm evaluation deadline: July 10  
End date: August 24  

- week 1: Introduce a base class swiftsdk, from which wasmswiftsdk inherits, and move the Wasm-specific options into the derived class
- week 2: introduce experimental flag passing sysroot to ` swiftsdk`
- week 4: Introduce a base class stdlib, from which wasmstdlib inherits, and move the Wasm-specific options into the derived class
- week 3: preparations before introducing new build products 
- week 7: add linuxswiftsdk which inherits from` swiftsdk` and take care of cmake options
- week 5: add linuxstdlib which inherits from` stdlib` and take care of cmake options
- week 6: documentation for midterm: write a blog post on Swift Forums and start writing documentation in a new file under docs/LinuxCrossCompile.md
- week 7: to be filled
- week 8-9: establish and run compiler tests from` run-test` using option` run-target` for Linux platform
- week 10: split out foundation build from` swiftsdk` into a separate new build product and declare its dependency in ` swiftsdk`
- week 11: split out xctest and swift testing builds from` swiftsdk` into separate new build products and  declare its dependency in ` swiftsdk`
- week 12: finalize documentation

