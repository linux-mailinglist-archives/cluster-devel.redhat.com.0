Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id DEFEB412763
	for <lists+cluster-devel@lfdr.de>; Mon, 20 Sep 2021 22:39:54 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-AeBokfeBMKGnNXVZOC-IzQ-1; Mon, 20 Sep 2021 16:39:52 -0400
X-MC-Unique: AeBokfeBMKGnNXVZOC-IzQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 493971023F4F;
	Mon, 20 Sep 2021 20:39:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C7FFA1002EF0;
	Mon, 20 Sep 2021 20:39:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 494484EA2A;
	Mon, 20 Sep 2021 20:39:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18KJCI64005516 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 20 Sep 2021 15:12:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0D2F221568B8; Mon, 20 Sep 2021 19:12:18 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 02F7021568B4
	for <cluster-devel@redhat.com>; Mon, 20 Sep 2021 19:12:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 28D79800B36
	for <cluster-devel@redhat.com>; Mon, 20 Sep 2021 19:12:07 +0000 (UTC)
Received: from smtp-relay-internal-0.canonical.com
	(smtp-relay-internal-0.canonical.com [185.125.188.122]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-518-TNCj9GVVPQCmI9wOSCD6dQ-1;
	Mon, 20 Sep 2021 15:12:05 -0400
X-MC-Unique: TNCj9GVVPQCmI9wOSCD6dQ-1
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
	[209.85.215.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
	SHA256) (No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id
	AF94440265
	for <cluster-devel@redhat.com>; Mon, 20 Sep 2021 19:05:38 +0000 (UTC)
Received: by mail-pg1-f199.google.com with SMTP id
	n9-20020a63f809000000b0026930ed1b24so16006916pgh.23
	for <cluster-devel@redhat.com>; Mon, 20 Sep 2021 12:05:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=N1jlmDSs8H0I7NLlGSj51cpDN2fjb2N3sgtJnV4vW+w=;
	b=M750myDpxdsY50k4G1E5TRReHyvN1+p/W3vQyk0T1ZYLEJT9ZG8Xq+Zt4ADRb0Wu8B
	JRtWwj5wS7AUb4HToUqQRwf8gV5ctnIuntRj8XyrIyscGZOgihFw+Bq/Ix1jcwZ6Ps4N
	IhgLXI3cwTAf7IEvx/p19boLSlGbuKs8ScOG6BLo7vNhGtr3vqdZvma+SvmpNzsfQVhG
	iVIZ9oM8vhwezCeZHfele/M7EatHjz7Un4JfFhGKmI0o2rfZQtCjgk502zJi/fpDoiMs
	dBaroHfraFCcmVWW9sRPZTe4g/0e7tmWoeQ9Jrp2XNynSgkV7LoHy7NvIrq/QN6ZVE0M
	GByQ==
X-Gm-Message-State: AOAM530Q3v+iiw0gmatblj/x7cBHfcQZbrK2xHCJOFx3ej+sq3TCtBac
	wnolXhpE5t8OylnhaR0lWP4kWz3GNZOodFVUY9mSQsKsrdx1y2mxlopgP7e2X6vjwQ44HhmAA4E
	biaCmcjvHS0kkc6kbyutLolNt6G3hbJlDjZR0
X-Received: by 2002:a63:f346:: with SMTP id t6mr24668799pgj.345.1632164736987; 
	Mon, 20 Sep 2021 12:05:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxhabpRbi2FUhM5/agVT+o9dMdu+hHL1/0/QLW2Q1CXcI39gGGyhNspJi+3wGqmuJFO7H3o3w==
X-Received: by 2002:a63:f346:: with SMTP id t6mr24668784pgj.345.1632164736788; 
	Mon, 20 Sep 2021 12:05:36 -0700 (PDT)
Received: from localhost.localdomain ([69.163.84.166])
	by smtp.gmail.com with ESMTPSA id l1sm203209pju.15.2021.09.20.12.05.35
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 20 Sep 2021 12:05:36 -0700 (PDT)
From: Tim Gardner <tim.gardner@canonical.com>
To: cluster-devel@redhat.com
Date: Mon, 20 Sep 2021 13:05:18 -0600
Message-Id: <20210920190518.23056-1-tim.gardner@canonical.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 18KJCI64005516
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Mon, 20 Sep 2021 16:39:42 -0400
Cc: tim.gardner@canonical.com, linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [PATCH] gfs2: Fix unused value warning in
	do_gfs2_set_flags()
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 8bit

Coverity complains of an unused value:

CID 119623 (#1 of 1): Unused value (UNUSED_VALUE)
assigned_value: Assigning value -1 to error here, but that stored value is
overwritten before it can be used.
237        error = -EPERM;

Fix it by removing the assignment.

Cc: Bob Peterson <rpeterso@redhat.com>
Cc: Andreas Gruenbacher <agruenba@redhat.com>
Cc: cluster-devel@redhat.com
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Tim Gardner <tim.gardner@canonical.com>
---
 fs/gfs2/file.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
index 354cf85154a6..7e09d2168030 100644
--- a/fs/gfs2/file.c
+++ b/fs/gfs2/file.c
@@ -234,7 +234,6 @@ static int do_gfs2_set_flags(struct inode *inode, u32 reqflags, u32 mask)
 	if ((new_flags ^ flags) == 0)
 		goto out;
 
-	error = -EPERM;
 	if (!IS_IMMUTABLE(inode)) {
 		error = gfs2_permission(&init_user_ns, inode, MAY_WRITE);
 		if (error)
-- 
2.33.0


