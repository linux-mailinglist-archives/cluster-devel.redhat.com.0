Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 791AC6FE157
	for <lists+cluster-devel@lfdr.de>; Wed, 10 May 2023 17:13:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683731617;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=ZJUto55bOrM/AKn9vrJKis77svEUcFeAvNCjhvZkuZo=;
	b=KDepC+eo76pvZX7qrYIjDNeCbZF7x0T0QkBAgDOzEcLMRARNTWzYzn7gWhcBtgeambgDQW
	KKEM1ITk7NmTgdCY20gszjgjLI/2P6aO8LmyXiQMD0QdS8p7XvD4qwF03K24Pt4u8zbEqw
	jQraeJt+rNhK0BAyt/yMLUBe7wkLIk8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-672-vh-r5nO7MVOCMHT4vjDd_w-1; Wed, 10 May 2023 11:13:34 -0400
X-MC-Unique: vh-r5nO7MVOCMHT4vjDd_w-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D554D3C0ED52;
	Wed, 10 May 2023 15:13:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9FB40492C13;
	Wed, 10 May 2023 15:13:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id EB1CF19451C0;
	Wed, 10 May 2023 15:13:20 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9445A1946A45 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 10 May 2023 15:13:19 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7230C2026D25; Wed, 10 May 2023 15:13:14 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A9732026D16
 for <cluster-devel@redhat.com>; Wed, 10 May 2023 15:13:14 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4DC5829ABA1D
 for <cluster-devel@redhat.com>; Wed, 10 May 2023 15:13:14 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com
 [209.85.219.173]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-135--Fl-pR3kNhOMrkn5Iaz2rA-1; Wed, 10 May 2023 11:12:42 -0400
X-MC-Unique: -Fl-pR3kNhOMrkn5Iaz2rA-1
Received: by mail-yb1-f173.google.com with SMTP id
 3f1490d57ef6-b9a6eec8611so36432373276.0
 for <cluster-devel@redhat.com>; Wed, 10 May 2023 08:12:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683731546; x=1686323546;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZJUto55bOrM/AKn9vrJKis77svEUcFeAvNCjhvZkuZo=;
 b=k2QbymR830UkLoHN5AYU8DNX0tBtyq5zzi1mUjGrVFEN2kLlfPKRFX5ch82qLdQDRG
 ZefAifaZAoAgMD/Z0Lxxn8apKqZzNjL6ZscBr/vD3siaA/MPmVBXeTrVQrRXU6Lf46Do
 FN+PxyZLRCtqRxxZKBYNOF4Ss+1TWT3J3PzPyDX4dHcgnMbIyhm3xvlZfzhvSJgSm71g
 5sYY1JDPo42FQOQuGeHM2e2obi/nGaVDnAJzUyJr3KCzbf1SwscuTpavwrp8GbVGFjUp
 BK+6B2YxjqrGoZFLwY1OzlOJF0vdDKorHSVNUAxmki2hBrTyNhGJSTE7QwgWLvcXlQuX
 QYIg==
X-Gm-Message-State: AC+VfDw6B/x88mZ35cL+2J/FFGMLKCHeAaFF8qn8jbP6X5/UA27owpmx
 7s5f7ltyNPC3KaYSSgoWAAYm0i23KRwZxIIsH6aPkQ21CUg=
X-Google-Smtp-Source: ACHHUZ4o1M8jmOewdO1bttM3comATURp/w6g9dYdWIdiuRn+0nzfjiD+leYHW45TsbCdwG9HhY5ckUqWpBKOggwhLGc=
X-Received: by 2002:a25:1489:0:b0:ba2:c466:cd84 with SMTP id
 131-20020a251489000000b00ba2c466cd84mr10466204ybu.3.1683731546214; Wed, 10
 May 2023 08:12:26 -0700 (PDT)
MIME-Version: 1.0
From: Turritopsis Dohrnii Teo En Ming <tdtemccnp@gmail.com>
Date: Wed, 10 May 2023 23:12:26 +0800
Message-ID: <CAD3upLsRxrvG0GAcFZj+BfAb6jbwd-vc2170sZHguWu4mRJpog@mail.gmail.com>
To: cluster-devel@redhat.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: [Cluster-devel] I have been given the guide with full network
 diagram on configuring High Availability (HA) Cluster and SD-WAN for
 Fortigate firewalls by my boss on 10 May 2023 Wed
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
Cc: ceo@teo-en-ming-corp.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Type: text/plain; charset="UTF-8"

Subject: I have been given the guide with full network diagram on
configuring High Availability (HA) Cluster and SD-WAN for Fortigate
firewalls by my boss on 10 May 2023 Wed

Good day from Singapore,

I have been given the guide with full network diagram on configuring
High Availability (HA) Cluster and SD-WAN for Fortigate firewalls by
my boss on 10 May 2023 Wed. This involves 2 ISPs, 2 identical
Fortigate firewalls and 3 network switches.

Reference guide: SD-WAN with FGCP HA
Link: https://docs.fortinet.com/document/fortigate/6.2.14/cookbook/23145/sd-wan-with-fgcp-ha

I have managed to deploy HA cluster and SD-WAN for a nursing home at
Serangoon Singapore on 9 May 2023 Tue, with some minor hiccups. The
hiccup is due to M1 ISP ONT not accepting connections from 2 Fortigate
firewalls. Singtel ISP ONT accepts connections from 2 Fortigate
firewalls without any problems though. On 9 May 2023 Tue, I was
following the network diagram drawn by my team leader KKK. My team
leader KKK's network diagram matches the network diagram in Fortinet's
guide shown in the link above.

The nursing home purchased the following network equipment:

[1] 2 units of Fortigate 101F firewalls with firmware upgraded to version 7.2.4

[2] 3 units of Aruba Instant On 1830 8-port network switches

[3] Multiple 5-meter LAN cables

Thank you.

Regards,

Mr. Turritopsis Dohrnii Teo En Ming
Targeted Individual in Singapore
Blogs:
https://tdtemcerts.blogspot.com
https://tdtemcerts.wordpress.com
GIMP also stands for Government-Induced Medical Problems.

