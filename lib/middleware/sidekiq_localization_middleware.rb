class SidekiqLocalizationMiddleware
  def call(_worker, msg, _queue, &block)
    args = msg['args']
    timezone_hash = find_timezone_in_args(args)

    timezone = timezone_hash ? delete_timezone_from_args(timezone_hash, args) : default_timezone

    Time.use_zone(timezone, &block)
  end

  private

  def find_timezone_in_args(args)
    args.find do |arg|
      arg.is_a?(Hash) && arg['timezone']
    end
  end

  def delete_timezone_from_args(timezone_hash, args)
    args = args.delete(timezone_hash)
    args['timezone']
  end

  def default_timezone
    Time.zone.name
  end
end
