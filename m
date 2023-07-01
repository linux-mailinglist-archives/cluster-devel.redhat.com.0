Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E0FE9744972
	for <lists+cluster-devel@lfdr.de>; Sat,  1 Jul 2023 15:45:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688219139;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+C/4T8cv/g259PbrpddQVKpbG9MYx13Tvy5z6SA2G1Y=;
	b=AUcuVJR1qgXVSjA0YwbQnZYMuMrIxQKHrAYO5Omm/BoAHVrPcFmd6nM+eAp6zjrB2qgvUF
	d7GIfPvGoubThSszvWfk4NcE3KawaxXZCZc9HB+yseqpzH55iTJ+MDKT6auyE1MBmcLip+
	U1MWs7TaoeF6KCq9FLOgJjaVQHoPbcE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-528-ObhCuQW-Oaq6CEQMz3T_Hg-1; Sat, 01 Jul 2023 09:45:35 -0400
X-MC-Unique: ObhCuQW-Oaq6CEQMz3T_Hg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 03BC5283476C;
	Sat,  1 Jul 2023 13:45:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8A0764CD0C8;
	Sat,  1 Jul 2023 13:45:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6285E1946A48;
	Sat,  1 Jul 2023 13:45:33 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 18D131946595 for <cluster-devel@listman.corp.redhat.com>;
 Sat,  1 Jul 2023 13:45:33 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 042B84067A01; Sat,  1 Jul 2023 13:45:33 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F089A4067A00
 for <cluster-devel@redhat.com>; Sat,  1 Jul 2023 13:45:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 306511C04190
 for <cluster-devel@redhat.com>; Sat,  1 Jul 2023 13:45:32 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-196-cM0Q6La7MyCvKb0RksoMcA-1; Sat, 01 Jul 2023 09:45:28 -0400
X-MC-Unique: cM0Q6La7MyCvKb0RksoMcA-1
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-3113dabc549so3681477f8f.1; 
 Sat, 01 Jul 2023 06:45:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688219127; x=1690811127;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=spl3Nt5Mh1u6Uhlm9oKAy/7Yr7EModW5k9NwVSB4Gms=;
 b=gJe1zy7IKy/SY9N0FcCmwQujyUE39kiFVFW6wbLz1ChEx+6AqlmqLosJd3Ikt1d9BM
 GkzBfFy2Aac5jcCFPUErm6UUHs6C2jXl+1P7VVVHJiEDLI+Lr8oRNl4UjPiFP7YY9y/A
 2+4f3c9fnHzo58W61yU/XtOKMQ1pru5nQy1t75P8YFx+vJY7w54qwOHeBZrsavHrOm3m
 ql90M4hwwA9phNznaxYwxeVjlCeIGSv2mjmv1ZRcRzE5t7l9lNeLMuXwWaDm6XTAj6ho
 jBiagJ5+twyg7wHmHVGpJKQplkR7GEL5+fUhb0wNsZCt6IBCkaacS7I8lTo9TvV0uJHR
 Xgbw==
X-Gm-Message-State: ABy/qLZympXKZoLr/krXLEyBARYSCxmd0EGhGOT3WFASHPNBVU7l23dZ
 FMuq+vvOPJxRwvsKUAWNTiKhdwWrUXM=
X-Google-Smtp-Source: APBJJlFVf4dqgcV+O5QCrl2XMsX21r25ocAt5xvcDIt4CgAYJ2iCMSmdlE5QCxFjdJQYx6SfgDZ7kQ==
X-Received: by 2002:adf:ed45:0:b0:314:17a9:9f36 with SMTP id
 u5-20020adfed45000000b0031417a99f36mr4447038wro.69.1688219126541; 
 Sat, 01 Jul 2023 06:45:26 -0700 (PDT)
Received: from suse.localnet (host-82-49-237-33.retail.telecomitalia.it.
 [82.49.237.33]) by smtp.gmail.com with ESMTPSA id
 g11-20020a7bc4cb000000b003fbab76165asm11130532wmk.48.2023.07.01.06.45.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Jul 2023 06:45:25 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Bob Peterson <rpeterso@redhat.com>,
 Andreas Gruenbacher <agruenba@redhat.com>, cluster-devel@redhat.com,
 linux-kernel@vger.kernel.org, Deepak R Varma <drv@mailo.com>
Date: Sat, 01 Jul 2023 15:45:24 +0200
Message-ID: <4817807.GXAFRqVoOG@suse>
In-Reply-To: <7ad72f9d1a97d673483c206d8ac9a88f2e32d3b9.1688073459.git.drv@mailo.com>
References: <cover.1688073459.git.drv@mailo.com>
 <7ad72f9d1a97d673483c206d8ac9a88f2e32d3b9.1688073459.git.drv@mailo.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: Re: [Cluster-devel] [PATCH v3 5/6] gfs2: Replace kmap() by
 kmap_local_page() in gfs2_read_super
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
Cc: Deepak R Varma <drv@mailo.com>, Ira Weiny <ira.weiny@intel.com>,
 Sumitra Sharma <sumitraartsy@gmail.com>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On gioved=C3=AC 29 giugno 2023 23:51:53 CEST Deepak R Varma wrote:
> The use of kmap() is being deprecated in favor of kmap_local_page().
>=20
> There are two main problems with kmap(): (1) It comes with an overhead as
> the mapping space is restricted and protected by a global lock for
> synchronization and (2) it also requires global TLB invalidation when the
> kmap=E2=80=99s pool wraps and it might block when the mapping space is fu=
lly
> utilized until a slot becomes available.
>=20
> With kmap_local_page() the mappings are per thread, CPU local, can take
> page faults, and can be called from any context (including interrupts).
> It is faster than kmap() in kernels with HIGHMEM enabled. Furthermore,
> the tasks can be preempted and, when they are scheduled to run again, the
> kernel virtual addresses are restored and still valid.
>=20
> Therefore, replace kmap() with kmap_local_page() in gfs2_read_super().
>=20
> Suggested-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> Signed-off-by: Deepak R Varma <drv@mailo.com>
> ---
> Changes in v3:
>    - Patch included in patch set
>=20
> Changes in v2:
>    - None
>=20
>  fs/gfs2/ops_fstype.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
> index 8a27957dbfee..80fe61662412 100644
> --- a/fs/gfs2/ops_fstype.c
> +++ b/fs/gfs2/ops_fstype.c
> @@ -264,9 +264,9 @@ static int gfs2_read_super(struct gfs2_sbd *sdp,=20
sector_t
> sector, int silent) __free_page(page);
>  =09=09return -EIO;
>  =09}
> -=09p =3D kmap(page);
> +=09p =3D kmap_local_page(page);
>
Deepak,

Could this page ever come from ZONE_HIGHMEM? Can you please check whether w=
e=20
really need to kmap*() it or not?=20

Fabio
>
>  =09gfs2_sb_in(sdp, p);
> -=09kunmap(page);
> +=09kunmap_local(p);
>  =09__free_page(page);
>  =09return gfs2_check_sb(sdp, silent);
>  }
> --
> 2.34.1




