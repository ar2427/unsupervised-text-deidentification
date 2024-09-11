import matplotlib.pyplot as plt

# Updated data
# ClinicalBERT
ClinicalBERT_data = [
[0.0, 0.9028], 
[0.0016, 0.9093], 
[0.0263, 0.4598], 
[0.0297, 0.4245], 
[0.0337, 0.4076], 
[0.0551, 0.3545], 
[0.0783, 0.3579], 
[0.0913, 0.352], 
[0.1121, 0.2654], 
[0.1318, 0.2107], 
[0.1533, 0.1854], 
[0.1647, 0.1579], 
[0.1958, 0.1038], 
[0.2036, 0.07846], 
[0.2065, 0.07627], 
[0.2092, 0.0719]
]

# BiLSTM-CRF
BiLSTM_CRF_data = [
[0.0, 0.9028], 
[0.0148, 0.819], 
[0.0168, 0.8132], 
[0.0183, 0.7646], 
[0.0196, 0.7971], 
[0.0242, 0.7958], 
[0.0285, 0.7504], 
[0.0335, 0.7675], 
[0.0437, 0.7298], 
[0.0613, 0.7214], 
[0.0868, 0.5472], 
[0.1007, 0.5185], 
[0.1336, 0.3752], 
[0.1659, 0.3852], 
[0.19, 0.2551], 
[0.23, 0.1436]
]

# PHILTER
PHILTER_data = [
[0.0, 0.9028], 
[0.0176, 0.8522], 
[0.0374, 0.8357], 
[0.0569, 0.7926], 
[0.091, 0.63], 
[0.1576, 0.1923], 
[0.1757, 0.2171], 
[0.189, 0.1514], 
[0.1907, 0.09823], 
[0.1907, 0.1027], 
[0.1907, 0.1047], 
[0.1907, 0.1452], 
[0.1907, 0.1504], 
[0.1907, 0.1568], 
[0.1907, 0.1581], 
[0.1907, 0.1597], 
[0.196, 0.1398]
]

# Extracting x and y values
x1, y1 = zip(*ClinicalBERT_data)
x2, y2 = zip(*BiLSTM_CRF_data)
x3, y3 = zip(*PHILTER_data)

# Setting plot's parameters
font = {'size'   : 15}
plt.rc('font', **font)

# Plotting the data
plt.figure(figsize=(10, 6))
plt.plot(x1, y1, marker='o', label='ClinicalBERT Tool', linestyle='-', color='red')
plt.plot(x2, y2, marker='s', label='BiLSTM-CRF Tool', linestyle='--', color='blue')
plt.plot(x3, y3, marker='x', label='PHILTER Tool', linestyle=':', color='green')

# Add vertical lines to indicate sections with thicker, more pronounced lines
plt.axvline(x=0.05, color='black', linestyle='--', linewidth=2, label='Low-Moderate Boundary (5%)')
plt.axvline(x=0.15, color='black', linestyle='--', linewidth=2, label='Moderate-High Boundary (15%)')

# Adding titles and labels
plt.title('Comparative Graph of ClinicalBERT Tool, BiLSTM-CRF Tool, and PHILTER Tool')
plt.xlabel('% Text masked')
plt.ylabel('Reidentification accuracy %')

# Adding a legend
plt.legend()

# Display the plot with grid
plt.grid(True)
plt.show()
plt.savefig("plot_masking_percentage_vs_val_acc_graph.png")
