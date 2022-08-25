Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ECD75A1970
	for <lists+cluster-devel@lfdr.de>; Thu, 25 Aug 2022 21:22:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661455332;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=j11I9jJbBdP2EsV8zm8vGrZ8to2ALD+DZiEMfyWlhf4=;
	b=QMEAPWB0IIhdiDmn7T1Ltlcl58ETAUmEBDDUWAuA0e/t5Vx8QzqmygNdmgtye4Vp7iFo9f
	Ddga9lx9/zOU3Qe0RrpOBAxwwGtO3y7RuTJRQWdG3bQTyjNXLXzAfH5nZII2D8XvyByuQ0
	1S8scgqwU0iyigJk7u/Re9dowoRoaC4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-304-W1SptAtUPC-pxSQzvLa8uA-1; Thu, 25 Aug 2022 15:22:10 -0400
X-MC-Unique: W1SptAtUPC-pxSQzvLa8uA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 305D0811E87;
	Thu, 25 Aug 2022 19:22:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9106C492C3B;
	Thu, 25 Aug 2022 19:22:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 464B61946A5E;
	Thu, 25 Aug 2022 19:22:07 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D02E41946A43 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 25 Aug 2022 19:22:05 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 895232166B29; Thu, 25 Aug 2022 19:22:05 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 854C42166B26
 for <cluster-devel@redhat.com>; Thu, 25 Aug 2022 19:22:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 65A1C85A58A
 for <cluster-devel@redhat.com>; Thu, 25 Aug 2022 19:22:05 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
 [209.85.167.173]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-169-ChhWhJIQOxWjHZhag49TxQ-1; Thu, 25 Aug 2022 15:22:03 -0400
X-MC-Unique: ChhWhJIQOxWjHZhag49TxQ-1
Received: by mail-oi1-f173.google.com with SMTP id a133so16655166oif.4
 for <cluster-devel@redhat.com>; Thu, 25 Aug 2022 12:22:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=j11I9jJbBdP2EsV8zm8vGrZ8to2ALD+DZiEMfyWlhf4=;
 b=msliGjgisFz7c8DUzTFVZSk3FCgZ/LbGB8884V3Vw5mcU0Q1Ys5eKJQPqMk164tRp2
 CIKghiY0x98oQbiPHJT/Zpm8wcSZHP3qA+PWHEDiDvCMggtP8NJolc6amYiVfrTSbveX
 HfTisOtKC/CtDc+RO0ssnqwlaBLhALP0bvjAdKI7NHUntAfbM+wxvg0165jzxrGANmX9
 Hf3reIFBiu8Q/V2HHZVoBOB6MV67rB2pF82puJ1pJC1WhAjNuj9uHvqAC6MCAKru4ua5
 jmdFNh4BZiGkUpGJ3wdKLgvnCeyk3Da6BRahcZp36OUDcJHME6Z7IUwoE13sqOwvR5iy
 54qQ==
X-Gm-Message-State: ACgBeo16+TiyzOPWEUcQ7eSZ6uDhaERY9k2wvDpeRshnS/FVOnQ/F2Xr
 YsAyOEZ0VCAeGqay+OVGCLs8VUWKIXIx6yVmOvho
X-Google-Smtp-Source: AA6agR5+NrNDgFeVEqQOH6xO8KzleveZvD24+0ma4hp6CR5I88pcrQbnickGgaR7sl54W0OczwK1VkCsRh+9Rsqv/HQ=
X-Received: by 2002:a05:6808:3a9:b0:343:4b14:ccce with SMTP id
 n9-20020a05680803a900b003434b14cccemr243316oie.41.1661455322788; Thu, 25 Aug
 2022 12:22:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220825001830.1911524-1-kuba@kernel.org>
In-Reply-To: <20220825001830.1911524-1-kuba@kernel.org>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 25 Aug 2022 15:21:52 -0400
Message-ID: <CAHC9VhSxesi0TSSvcQSr1kDhP3Vce4+O3w2diEExGEGnjGpmiw@mail.gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Subject: Re: [Cluster-devel] [PATCH net-next] genetlink: start to validate
 reserved header bytes
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Cc: linux-s390@vger.kernel.org, virtualization@lists.linux-foundation.org,
 edumazet@google.com, target-devel@vger.kernel.org, dev@openvswitch.org,
 linux-cifs@vger.kernel.org, linux-scsi@vger.kernel.org,
 cluster-devel@redhat.com, tipc-discussion@lists.sourceforge.net,
 pabeni@redhat.com, jiri@resnulli.us, linux-pm@vger.kernel.org,
 osmocom-net-gprs@lists.osmocom.org, linux-block@vger.kernel.org,
 mptcp@lists.linux.dev, netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-security-module@vger.kernel.org, netfilter-devel@vger.kernel.org,
 johannes@sipsolutions.net, linux-wpan@vger.kernel.org, davem@davemloft.net,
 wireguard@lists.zx2c4.com, lvs-devel@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 24, 2022 at 8:18 PM Jakub Kicinski <kuba@kernel.org> wrote:
>
> We had historically not checked that genlmsghdr.reserved
> is 0 on input which prevents us from using those precious
> bytes in the future.
>
> One use case would be to extend the cmd field, which is
> currently just 8 bits wide and 256 is not a lot of commands
> for some core families.
>
> To make sure that new families do the right thing by default
> put the onus of opting out of validation on existing families.
>
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
> CC: jiri@resnulli.us
> CC: johannes@sipsolutions.net
> CC: linux-block@vger.kernel.org
> CC: osmocom-net-gprs@lists.osmocom.org
> CC: linux-wpan@vger.kernel.org
> CC: wireguard@lists.zx2c4.com
> CC: linux-wireless@vger.kernel.org
> CC: linux-scsi@vger.kernel.org
> CC: target-devel@vger.kernel.org
> CC: linux-pm@vger.kernel.org
> CC: virtualization@lists.linux-foundation.org
> CC: linux-cifs@vger.kernel.org
> CC: cluster-devel@redhat.com
> CC: mptcp@lists.linux.dev
> CC: lvs-devel@vger.kernel.org
> CC: netfilter-devel@vger.kernel.org
> CC: linux-security-module@vger.kernel.org
> CC: dev@openvswitch.org
> CC: linux-s390@vger.kernel.org
> CC: tipc-discussion@lists.sourceforge.net
> ---
>  drivers/block/nbd.c                      | 1 +
>  drivers/net/gtp.c                        | 1 +
>  drivers/net/ieee802154/mac802154_hwsim.c | 1 +
>  drivers/net/macsec.c                     | 1 +
>  drivers/net/team/team.c                  | 1 +
>  drivers/net/wireguard/netlink.c          | 1 +
>  drivers/net/wireless/mac80211_hwsim.c    | 1 +
>  drivers/target/target_core_user.c        | 1 +
>  drivers/thermal/thermal_netlink.c        | 1 +
>  drivers/vdpa/vdpa.c                      | 1 +
>  fs/cifs/netlink.c                        | 1 +
>  fs/dlm/netlink.c                         | 1 +
>  fs/ksmbd/transport_ipc.c                 | 1 +
>  include/linux/genl_magic_func.h          | 1 +
>  include/net/genetlink.h                  | 3 +++
>  kernel/taskstats.c                       | 1 +
>  net/batman-adv/netlink.c                 | 1 +
>  net/core/devlink.c                       | 1 +
>  net/core/drop_monitor.c                  | 1 +
>  net/ethtool/netlink.c                    | 1 +
>  net/hsr/hsr_netlink.c                    | 1 +
>  net/ieee802154/netlink.c                 | 1 +
>  net/ieee802154/nl802154.c                | 1 +
>  net/ipv4/fou.c                           | 1 +
>  net/ipv4/tcp_metrics.c                   | 1 +
>  net/ipv6/ila/ila_main.c                  | 1 +
>  net/ipv6/ioam6.c                         | 1 +
>  net/ipv6/seg6.c                          | 1 +
>  net/l2tp/l2tp_netlink.c                  | 1 +
>  net/mptcp/pm_netlink.c                   | 1 +
>  net/ncsi/ncsi-netlink.c                  | 1 +
>  net/netfilter/ipvs/ip_vs_ctl.c           | 1 +
>  net/netlabel/netlabel_calipso.c          | 1 +
>  net/netlabel/netlabel_cipso_v4.c         | 1 +
>  net/netlabel/netlabel_mgmt.c             | 1 +
>  net/netlabel/netlabel_unlabeled.c        | 1 +
>  net/netlink/genetlink.c                  | 4 ++++
>  net/nfc/netlink.c                        | 1 +
>  net/openvswitch/conntrack.c              | 1 +
>  net/openvswitch/datapath.c               | 3 +++
>  net/openvswitch/meter.c                  | 1 +
>  net/psample/psample.c                    | 1 +
>  net/smc/smc_netlink.c                    | 3 ++-
>  net/smc/smc_pnet.c                       | 3 ++-
>  net/tipc/netlink.c                       | 1 +
>  net/tipc/netlink_compat.c                | 1 +
>  net/wireless/nl80211.c                   | 1 +
>  47 files changed, 56 insertions(+), 2 deletions(-)

Acked-by: Paul Moore <paul@paul-moore.com> (NetLabel)

-- 
paul-moore.com

