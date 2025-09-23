from transformers import pipeline

classifier = pipeline("zero-shot-classification", model = "facebook/bart-large-mnli")

text = ("Safari version 2.0 (412) does not clearly associate a Javascript dialog box with the web page that generated it, which allows remote attackers to spoof a dialog box from a trusted site and facilitates phishing attacks, aka the \"Dialog Origin Spoofing Vulnerability.")
labels = [
    "This is relevant to electronic health records or healthcare systems.",
    "This is NOT relevant to healthcare or EHR systems."
]

result = classifier(text, labels)
print(result)