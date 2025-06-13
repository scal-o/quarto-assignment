# Graphics Directory

This directory is for storing all graphical outputs and visualizations generated during the project.

## Contents

This directory will contain:
- Plot images (.png, .jpg, .svg, etc.)
- Charts and diagrams
- Maps and spatial visualizations
- Other graphical outputs

## Organization

Consider organizing graphics by section or analysis type for larger projects:
- `/exploratory` - Exploratory data analysis visualizations
- `/results` - Final visualizations for results
- `/presentations` - Visualizations formatted for presentations

## Output Conventions

When generating graphics in your code, save them to this directory using relative paths:

```python
import matplotlib.pyplot as plt

# Plot something
plt.figure(figsize=(10, 6))
plt.plot(x, y)
plt.title("My Analysis Results")

# Save to graphics directory
plt.savefig("../graphics/my_analysis_results.png", dpi=300)
```

## Best Practices

1. Use a descriptive naming convention (e.g., `variable_analysis_date.png`)
2. Save high-resolution images (recommended minimum 300 dpi)
3. Include captions and legends in your plots
4. Consider using a consistent color scheme across visualizations
5. Include appropriate axis labels and units