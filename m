Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 13AAC4959BA
	for <lists+cluster-devel@lfdr.de>; Fri, 21 Jan 2022 07:03:44 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-418--TDWtriAM4iJEDG9dd615g-1; Fri, 21 Jan 2022 01:03:41 -0500
X-MC-Unique: -TDWtriAM4iJEDG9dd615g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5589D814245;
	Fri, 21 Jan 2022 06:03:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3896C4EC77;
	Fri, 21 Jan 2022 06:03:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 93DB51809CB8;
	Fri, 21 Jan 2022 06:03:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
	[10.11.54.1])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20L61bdB014937 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 21 Jan 2022 01:01:37 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A8E6640CFD35; Fri, 21 Jan 2022 06:01:37 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A4C0B40CFD0F
	for <cluster-devel@redhat.com>; Fri, 21 Jan 2022 06:01:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 42DC6101A52D
	for <cluster-devel@redhat.com>; Fri, 21 Jan 2022 06:01:37 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
	[209.85.222.177]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-434-nvIkQ_ggO_yXMYzzVJdXxg-1; Fri, 21 Jan 2022 01:01:33 -0500
X-MC-Unique: nvIkQ_ggO_yXMYzzVJdXxg-1
Received: by mail-qk1-f177.google.com with SMTP id p9so8831259qkh.3;
	Thu, 20 Jan 2022 22:01:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=kuArtjaPTmOPdIiKrss07b+j2mZfFfYV+Yk+2Q5thaY=;
	b=sQagyztr9iagEWq15QXnldEX5o9LpTg9Tn+wmULTdPUXVK66cwWUBAxo5CDPhvvZZh
	13AYixvrP5fDIEr6AnklFONzClJqY+fUjeAKNGgvPWHb/7FnjrzCT55qiv3p55G8GriC
	9kEDcGW9I4boYmSw8ZjxuXGDrLxaHqkLV3gxP3mCpCao8KIM0hyUElYwplI42Xi3yC6+
	NXgK6HgGAmSq+cofq3QmVYG531UBvwCUNd0bR9exs20bqdZ7LAAQ9PMZjDMrN/lsa6g0
	7zYzjhdo00zWUnvg7JLGzL+YMLwxdEGenI64ydwok9o3kCv0pjtikEelj3D+sWLgGwwF
	WcuQ==
X-Gm-Message-State: AOAM5300RIrF+2YFTWF+colljQVcHz9iFtkxNnUMlnApEDMT124/QCtw
	28OVmjXzKW0banZMmvVqN79V0DAG0yA=
X-Google-Smtp-Source: ABdhPJwsKWvGQXWohgcIutSnGbz0mYKIPdC29ugMxH0lrql4MlOX703nnFWVvI5t5sjyPGJ7Sax1mg==
X-Received: by 2002:a05:620a:2698:: with SMTP id
	c24mr1763523qkp.262.1642744892338; 
	Thu, 20 Jan 2022 22:01:32 -0800 (PST)
Received: from localhost.localdomain ([193.203.214.57])
	by smtp.gmail.com with ESMTPSA id c7sm2611515qtd.24.2022.01.20.22.01.29
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 20 Jan 2022 22:01:31 -0800 (PST)
From: cgel.zte@gmail.com
X-Google-Original-From: lv.ruyi@zte.com.cn
To: rpeterso@redhat.com
Date: Fri, 21 Jan 2022 06:01:22 +0000
Message-Id: <20220121060122.998512-1-lv.ruyi@zte.com.cn>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-loop: cluster-devel@redhat.com
Cc: CGEL ZTE <cgel.zte@gmail.com>, Lv Ruyi <lv.ruyi@zte.com.cn>,
	linux-kernel@vger.kernel.org, cluster-devel@redhat.com,
	Zeal Robot <zealci@zte.com.cn>
Subject: [Cluster-devel] [PATCH] GFS2: move sleep outside the spinlock
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

From: Lv Ruyi <lv.ruyi@zte.com.cn>

Don't sleep with spinlock held, so move it outside critical section.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Lv Ruyi <lv.ruyi@zte.com.cn>
Signed-off-by: CGEL ZTE <cgel.zte@gmail.com>
---
 fs/gfs2/lock_dlm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/gfs2/lock_dlm.c b/fs/gfs2/lock_dlm.c
index 50578f881e6d..e43b33b115b4 100644
--- a/fs/gfs2/lock_dlm.c
+++ b/fs/gfs2/lock_dlm.c
@@ -942,14 +942,15 @@ static int control_mount(struct gfs2_sbd *sdp)
 		if (sdp->sd_args.ar_spectator) {
 			fs_info(sdp, "Recovery is required. Waiting for a "
 				"non-spectator to mount.\n");
+			spin_unlock(&ls->ls_recover_spin);
 			msleep_interruptible(1000);
 		} else {
 			fs_info(sdp, "control_mount wait1 block %u start %u "
 				"mount %u lvb %u flags %lx\n", block_gen,
 				start_gen, mount_gen, lvb_gen,
 				ls->ls_recover_flags);
+			spin_unlock(&ls->ls_recover_spin);
 		}
-		spin_unlock(&ls->ls_recover_spin);
 		goto restart;
 	}
 
-- 
2.25.1

