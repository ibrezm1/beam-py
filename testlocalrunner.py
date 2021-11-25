import argparse

import apache_beam as beam
from apache_beam.options.pipeline_options import PipelineOptions
import logging
logging.getLogger().setLevel(logging.INFO)
parser = argparse.ArgumentParser()
# parser.add_argument('--my-arg')
args, beam_args = parser.parse_known_args()

# Create and set your Pipeline Options.
beam_options = PipelineOptions(beam_args)


from apache_beam.options.pipeline_options import PipelineOptions

class MyOptions(PipelineOptions):
  @classmethod
  def _add_argparse_args(cls, parser):
    parser.add_argument(
        '--input-file',
        default='gs://dataflow-samples/shakespeare/kinglear.txt',
        help='The file path for the input text to process.')
    parser.add_argument(
        '--maxNumWorkers',
        default='1',
        help='Max workers to be used.')
    parser.add_argument(
        '--output-path',
        required=True,
        help='The path prefix for output files.')


args = beam_options.view_as(MyOptions)

with beam.Pipeline(options=beam_options) as pipeline:
  lines = (
      pipeline
      | beam.io.ReadFromText(args.input_file)
      | beam.io.WriteToText(args.output_path))


