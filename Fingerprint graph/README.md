The order I've implemented is in the order of the ordered files in src.

Here's what they did:

.... I doubt you're going to read this. So ask me for a README only if you want it. Otherwise this is the only thing you need to know:


capec_candidated_rich.json -> CAPECs related to healthcare through the chosen unique CWEs
capec_actions_raw.json -> Raw execution steps + techniques for each CAPEC from above file
action_vocab_helper.json -> List of action words extracted in action word, lowercase separated format from above file
action_vocab_canonical.json -> Clustered actions so similar actions are canonicalized

capec_graphs folder -> Contains per graphs for each CAPEC with metadata. You could inspect it using src #10

Regards.