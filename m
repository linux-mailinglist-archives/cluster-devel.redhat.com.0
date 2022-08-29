Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0A65A5D48
	for <lists+cluster-devel@lfdr.de>; Tue, 30 Aug 2022 09:47:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661845631;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=amSg7vvBJSJqpRTu6TdqlSZQO/u4j3cidqL3kL4gOxQ=;
	b=VAhoMOvwG4B0EFavzCQsM2vVeY1PZRpEWJFE/ysufO8++iOiyus9z3ePDFtAO4UUriQv8Z
	gSGFllvEMMG5QwC3MfAEq4RDKqjskSttZN4o6ujI1a0BRr6aFUcAlVkDvF2wU3kXJ0NNFM
	D4TSKl2N+XAl47wScAoTix1IT2ZHNjg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-462-1nIdXjGbN5SOkaYc_sQ7dA-1; Tue, 30 Aug 2022 03:47:07 -0400
X-MC-Unique: 1nIdXjGbN5SOkaYc_sQ7dA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 00FDB3C025C5;
	Tue, 30 Aug 2022 07:47:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 990A2400EA8F;
	Tue, 30 Aug 2022 07:47:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 675A01946A47;
	Tue, 30 Aug 2022 07:47:03 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id ED6A21946A40 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 29 Aug 2022 12:19:59 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D99D2400E88E; Mon, 29 Aug 2022 12:19:59 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D468840149B4
 for <cluster-devel@redhat.com>; Mon, 29 Aug 2022 12:19:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BAC3C382C970
 for <cluster-devel@redhat.com>; Mon, 29 Aug 2022 12:19:59 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-502-rRhsWL6pMWm7IzcHp0ajeQ-1; Mon, 29 Aug 2022 08:19:58 -0400
X-MC-Unique: rRhsWL6pMWm7IzcHp0ajeQ-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9903CB80EF7;
 Mon, 29 Aug 2022 12:10:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5EA1FC433D6;
 Mon, 29 Aug 2022 12:10:17 +0000 (UTC)
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 4809AE924D7; Mon, 29 Aug 2022 12:10:17 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <166177501728.22813.10790787483082655487.git-patchwork-notify@kernel.org>
Date: Mon, 29 Aug 2022 12:10:17 +0000
References: <20220825001830.1911524-1-kuba@kernel.org>
In-Reply-To: <20220825001830.1911524-1-kuba@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-Mailman-Approved-At: Tue, 30 Aug 2022 07:47:02 +0000
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
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello:

This patch was applied to netdev/net-next.git (master)
by David S. Miller <davem@davemloft.net>:

On Wed, 24 Aug 2022 17:18:30 -0700 you wrote:
> We had historically not checked that genlmsghdr.reserved
> is 0 on input which prevents us from using those precious
> bytes in the future.
>=20
> One use case would be to extend the cmd field, which is
> currently just 8 bits wide and 256 is not a lot of commands
> for some core families.
>=20
> [...]

Here is the summary with links:
  - [net-next] genetlink: start to validate reserved header bytes
    https://git.kernel.org/netdev/net-next/c/9c5d03d36251

You are awesome, thank you!
--=20
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


