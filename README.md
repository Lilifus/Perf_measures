# CPU and caches Informations
### lscpu OUTPUT
```
Architecture:                    x86_64
CPU op-mode(s):                  32-bit, 64-bit
Address sizes:                   39 bits physical, 48 bits virtual
Byte Order:                      Little Endian
CPU(s):                          2
On-line CPU(s) list:             0,1
Vendor ID:                       GenuineIntel
Model name:                      Intel(R) Celeron(R) N4020 CPU @ 1.10GHz
CPU family:                      6
Model:                           122
Thread(s) per core:              1
Core(s) per socket:              2
Socket(s):                       1
Stepping:                        8
CPU(s) scaling MHz:              53%
CPU max MHz:                     2800.0000
CPU min MHz:                     800.0000
BogoMIPS:                        2189.00
Flags:                           fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc cpuid aperfmperf tsc_known_freq pni pclmulqdq dtes64 monitor ds_cpl vmx est tm2 ssse3 sdbg cx16 xtpr pdcm sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave rdrand lahf_lm 3dnowprefetch cpuid_fault cat_l2 cdp_l2 ssbd ibrs ibpb stibp ibrs_enhanced tpr_shadow vnmi flexpriority ept vpid ept_ad fsgsbase tsc_adjust smep erms mpx rdt_a rdseed smap clflushopt intel_pt sha_ni xsaveopt xsavec xgetbv1 xsaves dtherm ida arat pln pts umip rdpid md_clear arch_capabilities
Virtualization:                  VT-x
L1d cache:                       48 KiB (2 instances)
L1i cache:                       64 KiB (2 instances)
L2 cache:                        4 MiB (1 instance)
NUMA node(s):                    1
NUMA node0 CPU(s):               0,1
Vulnerability Itlb multihit:     Not affected
Vulnerability L1tf:              Not affected
Vulnerability Mds:               Not affected
Vulnerability Meltdown:          Not affected
Vulnerability Mmio stale data:   Not affected
Vulnerability Retbleed:          Not affected
Vulnerability Spec store bypass: Mitigation; Speculative Store Bypass disabled via prctl
Vulnerability Spectre v1:        Mitigation; usercopy/swapgs barriers and __user pointer sanitization
Vulnerability Spectre v2:        Mitigation; Enhanced IBRS, IBPB conditional, RSB filling, PBRSB-eIBRS Not affected
Vulnerability Srbds:             Not affected
Vulnerability Tsx async abort:   Not affected
```
### L1 cache info
```
coherency_line_size:        64
id:                         0
level:                      1
number_of_sets:             64
physical_line_partition:    1
shared_cpu_list:            0
shared_cpu_map:             1
size:                       24K
type:                       Data
uevent: 
ways_of_associativity:      6
```
### L2 cache info
```
coherency_line_size:        64
id:                         0
level:                      2
number_of_sets:             4096
physical_line_partition:    1
shared_cpu_list:            0-1
shared_cpu_map:             3
size:                       4096K
type:                       Unified
uevent: 
ways_of_associativity:      16
```
