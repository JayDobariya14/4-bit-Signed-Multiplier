# 4-bit Signed Multiplier

## Overview
This project implements a 4-bit signed multiplier by updating an existing 4-bit unsigned multiplier. The design process involved adding an extra row of adders to the original unsigned design. To optimize the design, logic was reduced, and an optimized version was created. Additionally, a Wallace tree design was implemented to further improve the efficiency.

## Project Structure
- `src/`: Contains the Verilog source files for the multiplier.
- `diagrams/`: Includes block diagrams of the multiplier.
- `qflow/`: Contains the Qflow screenshots of the layout.
- `notes/`: Contains handwritten notes in digital format, detailing the design and optimization process.
- `testbench/`: Contains the testbench Verilog file used for simulation.

## Files
- `src/signed_multiplier.v`: Verilog code for the 4-bit signed multiplier.
- `src/optimized_signed_multiplier.v`: Verilog code for the optimized 4-bit signed multiplier.
- `src/wallace_tree_multiplier.v`: Verilog code for the Wallace tree design.

## How to Use
1. **Clone the repository**:
    ```bash
    git clone https://github.com/JayDobariya14/4-bit-Signed-Multiplier.git
    cd 4-bit-Signed-Multiplier
    ```

2. **Verilog Simulation**:
    - Use any Verilog simulation tool (e.g., ModelSim, VCS) to simulate the design using the provided testbench.

3. **Qflow Design**:
    - Open the Qflow project and load the relevant files to view the layout and other design aspects.

## Contributing
Feel free to fork this project, make improvements, and submit pull requests. Any contributions are welcome!

## Contact
For any questions or feedback, please contact:
- Jay Dobariya
- dobariyajay2004@gmail.com

