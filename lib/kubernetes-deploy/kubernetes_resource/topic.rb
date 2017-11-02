# frozen_string_literal: true
module KubernetesDeploy
  class Topic < KubernetesResource
    def sync
    end

    def deploy_succeeded?
      if @deploy_started && !@success_assumption_warning_shown
        @logger.warn("Don't know how to monitor resources of type #{type}. Assuming #{id} deployed successfully.")
        @success_assumption_warning_shown = true
      end
      true
    end

    def deploy_failed?
      false
    end

    def deploy_method
      :replace
    end
  end
end
