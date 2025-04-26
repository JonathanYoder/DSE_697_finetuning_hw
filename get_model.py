from transformers import AutoTokenizer, AutoModelForCausalLM
from huggingface_hub import login

# Note that my actual access token was used when running this
login(token="MY_ACCESS_TOKEN")

# Load (download) model directly
tokenizer = AutoTokenizer.from_pretrained("meta-llama/Llama-3.1-8B")
model = AutoModelForCausalLM.from_pretrained("meta-llama/Llama-3.1-8B")

# save models to cache directory
model_path = "/gpfs/wolf2/olcf/trn040/scratch/jyoder5/.cache/huggingface/meta-llama/Llama-3.1-8B"
tokenizer.save_pretrained(model_path)
model.save_pretrained(model_path)

# from huggingface_hub import snapshot_download

# snapshot_download(repo_id="meta-llama/Llama-3.1-8B", repo_type="model", local_dir="/gpfs/wolf2/olcf/trn040/scratch/jyoder5/finetune_hw/model_cache/meta-llama/Llama-3.1-8B")