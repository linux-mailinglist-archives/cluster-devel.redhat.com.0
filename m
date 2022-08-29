Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D02305A5D46
	for <lists+cluster-devel@lfdr.de>; Tue, 30 Aug 2022 09:47:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661845630;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=3F5bs6wEmRDmdIQe96V5iwCeWjK5YoVTeKEuPdxSfN4=;
	b=MVgwvI4/w/JIN7djVRPpCUCculfyuI1/w7Pa5O+G9jWdGZhig9eQSKg+MLAlfuIyY8Fjij
	gte6F34idG/MM8G08++uzQpQHC+dZ0whoHJ6MFV9TPTZpk184A5nol7yr/3/yEZdpyTOmQ
	rEsenhlXbvCoxHIOFRsz7hn3OUzC2ZU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-433-n-SAPyCIOOKQwfv5u0qt8w-1; Tue, 30 Aug 2022 03:47:08 -0400
X-MC-Unique: n-SAPyCIOOKQwfv5u0qt8w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 00FDC85A5BC;
	Tue, 30 Aug 2022 07:47:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0AAE61410F37;
	Tue, 30 Aug 2022 07:47:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C79771946A4B;
	Tue, 30 Aug 2022 07:47:03 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 02CE11946A40 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 29 Aug 2022 16:41:27 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D3523401473; Mon, 29 Aug 2022 16:41:27 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CFB40492C3B
 for <cluster-devel@redhat.com>; Mon, 29 Aug 2022 16:41:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B88D5185A79C
 for <cluster-devel@redhat.com>; Mon, 29 Aug 2022 16:41:27 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-474-6-ogwgzmO6CEPHiOJFvYjg-1; Mon, 29 Aug 2022 12:41:24 -0400
X-MC-Unique: 6-ogwgzmO6CEPHiOJFvYjg-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A6F3161210;
 Mon, 29 Aug 2022 16:33:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EF56C433D6;
 Mon, 29 Aug 2022 16:32:59 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 1de32b3b
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Mon, 29 Aug 2022 16:32:58 +0000 (UTC)
Date: Mon, 29 Aug 2022 12:32:54 -0400
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Jakub Kicinski <kuba@kernel.org>
Message-ID: <YwzqNgj/bJoawrwh@zx2c4.com>
References: <20220825001830.1911524-1-kuba@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20220825001830.1911524-1-kuba@kernel.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Jakub,

On Wed, Aug 24, 2022 at 05:18:30PM -0700, Jakub Kicinski wrote:
> diff --git a/drivers/net/wireguard/netlink.c b/drivers/net/wireguard/netlink.c
> index d0f3b6d7f408..0c0644e762e5 100644
> --- a/drivers/net/wireguard/netlink.c
> +++ b/drivers/net/wireguard/netlink.c
> @@ -621,6 +621,7 @@ static const struct genl_ops genl_ops[] = {
>  static struct genl_family genl_family __ro_after_init = {
>  	.ops = genl_ops,
>  	.n_ops = ARRAY_SIZE(genl_ops),
> +	.resv_start_op = WG_CMD_SET_DEVICE + 1,
>  	.name = WG_GENL_NAME,
>  	.version = WG_GENL_VERSION,
>  	.maxattr = WGDEVICE_A_MAX,

FWIW, I wouldn't object to just leaving this at zero. I don't know of
any wireguard userspaces doing anything with the reserved header field.

Jason

