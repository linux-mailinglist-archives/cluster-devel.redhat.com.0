Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 2D73A100AAD
	for <lists+cluster-devel@lfdr.de>; Mon, 18 Nov 2019 18:44:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574099050;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=eZh8ixCA5MAx1XtHCwRMiluk9ChUjNIbgevq1pFn4Xg=;
	b=f5SGM8+J4DyBQxndecPfVyQCSNjBQAkrFIJb6sk3k+IcdQCHBw8sSJAmlnScHdxyhlbK3x
	olJCzWRhy2My5Y2e8yrzfpcbqXsYJzq9/onsc2n+RkIF3jlQw3uBKPe0qEdpuhdwVKNOeS
	gWUI2faH1/EVA7pZ/BbCL7odK215j2c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-29-PZUUKa3LNmK0cT8PhJE2pQ-1; Mon, 18 Nov 2019 12:44:07 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 402081883522;
	Mon, 18 Nov 2019 17:44:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7300D5D9C9;
	Mon, 18 Nov 2019 17:44:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 16CD21802027;
	Mon, 18 Nov 2019 17:44:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAIHhtxb027157 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 18 Nov 2019 12:43:55 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A838C2166AE7; Mon, 18 Nov 2019 17:43:55 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A39DD2166AEA
	for <cluster-devel@redhat.com>; Mon, 18 Nov 2019 17:43:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8DB3A800211
	for <cluster-devel@redhat.com>; Mon, 18 Nov 2019 17:43:53 +0000 (UTC)
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
	[209.85.167.199]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-359-BQoJ0k_mP_WPfWwHz856Tg-1; Mon, 18 Nov 2019 12:43:50 -0500
Received: by mail-oi1-f199.google.com with SMTP id q82so9079352oih.14
	for <cluster-devel@redhat.com>; Mon, 18 Nov 2019 09:43:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=eZh8ixCA5MAx1XtHCwRMiluk9ChUjNIbgevq1pFn4Xg=;
	b=BScBSAHmqkfSFVb7ZYgIpFKWFP7IegjC7cn2mXoEaCrFBDdOWt9c4wM0yShTXzFjLC
	1AnTadE4i1sjKpfSPaEcFl7gbejAPJw+xPSP2D/5PIa2sD4WrA+JbKwOxyv4LDGR9jWb
	iqpKJrnnx3jDTKrMCXCpwC/jJYoDGs3EtbHuz2GG3DEA2xt2pfWKHRHjh6aUg3OABgrY
	Y1LOn/w529v2dWSnbodxmmb/C4OGjkNKVLgkMyRb0SPHB65FiJNM0C7eSupJF7oycptN
	5cNv3gL83Nc4nVm+PRj61qaNUXHI/8fD0ef93R7Qp8e3Qtzvw+gTCWT2fyQPoiPCymg8
	1Sfg==
X-Gm-Message-State: APjAAAWbRAUmj9wCRcS2T61RZX6QSX4FWYj2EDMDMgd6LVOcOcUI1A+1
	9QSCZBehi5Ls4RnpQxvgk4IFCrLPCN5ebSKWaA9kBX26ykJe7SXtgegQGkW6wxlm8GMwlEzHjJ4
	HS2h2F20NhYOiZygnA8D1BdCEzLnvx9OEplEnoQ==
X-Received: by 2002:aca:5cc6:: with SMTP id q189mr92509oib.101.1574099029548; 
	Mon, 18 Nov 2019 09:43:49 -0800 (PST)
X-Google-Smtp-Source: APXvYqx1GnXJoJITaG5bH6vDLkJtLTbGKIey2fMtSXAQ6NFhcgggAT/P1iOVMhOqlx9YDww8DCPe3QwNPvOP2/iuus8=
X-Received: by 2002:aca:5cc6:: with SMTP id q189mr92499oib.101.1574099029375; 
	Mon, 18 Nov 2019 09:43:49 -0800 (PST)
MIME-Version: 1.0
References: <1819526286.30262006.1573832637022.JavaMail.zimbra@redhat.com>
	<1255360710.30262128.1573832741690.JavaMail.zimbra@redhat.com>
	<CAHc6FU5zTfvnqjrhQ13Jid79Vfqrk68X_FusUwRyczgAfu3xMA@mail.gmail.com>
	<491033255.30283381.1573839581928.JavaMail.zimbra@redhat.com>
In-Reply-To: <491033255.30283381.1573839581928.JavaMail.zimbra@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Mon, 18 Nov 2019 18:43:38 +0100
Message-ID: <CAHc6FU4Xciv8WACoxZSif2FnWA8Y+P6x3AiDR1C2MJOL-vcU=g@mail.gmail.com>
To: Bob Peterson <rpeterso@redhat.com>
X-MC-Unique: BQoJ0k_mP_WPfWwHz856Tg-1
X-MC-Unique: PZUUKa3LNmK0cT8PhJE2pQ-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xAIHhtxb027157
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [GFS2 PATCH] gfs2: Close timing window with
	GLF_INVALIDATE_IN_PROGRESS
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Ok, pushed.

Thanks,
Andreas


