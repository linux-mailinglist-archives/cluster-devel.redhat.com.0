Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F21D0744913
	for <lists+cluster-devel@lfdr.de>; Sat,  1 Jul 2023 15:01:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688216479;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=KTYKcvCjBpZDS5UzcYzvP417c/hgMGSjHkLlhP5FYjQ=;
	b=W0fKsXQgCs/scmKnq7cPsU7MBaZYhBVp5zP5LDKYNrSoETVQUbj+pnk/6BsNcGeJ5/Yre5
	rx4NYt/+C4rNpEMiZS0UDiPWEEa8ez+Ve+eN+6b4oGVYYlmIhUzN/wC7J/VlGPdVsn2MR8
	8FLlY3t0ZAjHQT5qH29lE1ssXF4Otz4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-318-PvY0lQjMOBeGA8eIXOvONA-1; Sat, 01 Jul 2023 09:01:13 -0400
X-MC-Unique: PvY0lQjMOBeGA8eIXOvONA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 52CB010113D4;
	Sat,  1 Jul 2023 13:01:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 874E54067A00;
	Sat,  1 Jul 2023 13:01:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4F6631946A5E;
	Sat,  1 Jul 2023 13:01:10 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id ADCFC1946595 for <cluster-devel@listman.corp.redhat.com>;
 Sat,  1 Jul 2023 13:01:09 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 478FC4CD0C1; Sat,  1 Jul 2023 13:01:09 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 40CF7492C13
 for <cluster-devel@redhat.com>; Sat,  1 Jul 2023 13:01:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 231093803510
 for <cluster-devel@redhat.com>; Sat,  1 Jul 2023 13:01:09 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-151-0c0Em-TcM8aOXJ-0x0FutA-1; Sat, 01 Jul 2023 09:01:07 -0400
X-MC-Unique: 0c0Em-TcM8aOXJ-0x0FutA-1
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-4fb96e2b573so4776182e87.3; 
 Sat, 01 Jul 2023 06:01:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688216465; x=1690808465;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QzqV5Rrxm89YWqUbr+C1x/jOrYWel3k8dI9zQ9hOaBM=;
 b=k0hG6kT69vR2RlXlTOYg8fzf8wKAsB3jSEbL9iQ0VsdXNyOpmoSrXNcly9K56zI2Xf
 +x8wXEmUnIlmyp9BfXa780UVsoqa0WXnzTtnWb4t5osizizeG6JLMz1zfYoHhjsYp7H0
 zR21lNp0E/cGU5PQn9wuoPEkv1uRuxSCsBG11C0EmqgSL2eb9rEVqR/6P+VOCS3wgGpW
 mKqEUQLJ8rusJaPoses/EuNgF8Z5MO9CDZ7Fr16KKhuUgVoO682LnI+AhfZB1jzcA7FZ
 mfh5TTkIYvfGMnDXngmdIXOK/1jfWykSiJldhNdt2awClringYRklPVUjxJ8cF1XkVnN
 4bRQ==
X-Gm-Message-State: ABy/qLYgL0IGqOWeGJeX4dymsYgXOCRDZlxrdpKom2OvNCsa4A12ZWjD
 +kXf1ig7cuVunXkWM701lMqASRcbZjw=
X-Google-Smtp-Source: APBJJlGlq/bVtto9AnMnlXZwhGvJ4yJAbccQ1B750dCY1/Cgg6BA2x1mmBVOS43GYXvEuCmb3C3WjA==
X-Received: by 2002:a05:6512:3242:b0:4f8:6b82:56c4 with SMTP id
 c2-20020a056512324200b004f86b8256c4mr3679444lfr.33.1688216464529; 
 Sat, 01 Jul 2023 06:01:04 -0700 (PDT)
Received: from suse.localnet (host-212-171-6-230.pool212171.interbusiness.it.
 [212.171.6.230]) by smtp.gmail.com with ESMTPSA id
 d11-20020a1c730b000000b003fb416d732csm14208774wmb.6.2023.07.01.06.01.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Jul 2023 06:01:03 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Bob Peterson <rpeterso@redhat.com>,
 Andreas Gruenbacher <agruenba@redhat.com>, cluster-devel@redhat.com,
 linux-kernel@vger.kernel.org, Deepak R Varma <drv@mailo.com>
Date: Sat, 01 Jul 2023 15:01:02 +0200
Message-ID: <2946216.VdNmn5OnKV@suse>
In-Reply-To: <063721a02d5e226d1e9e9782f76ce94c16d73e93.1688073459.git.drv@mailo.com>
References: <cover.1688073459.git.drv@mailo.com>
 <063721a02d5e226d1e9e9782f76ce94c16d73e93.1688073459.git.drv@mailo.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: Re: [Cluster-devel] [PATCH v3 3/6] gfs2: Replace kmap() by
 kmap_local_page() in gfs2_unstuffer_page
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On gioved=C3=AC 29 giugno 2023 23:50:43 CEST Deepak R Varma wrote:
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
> Therefore, replace kmap() with kmap_local_page() in gfs2_unstuffer_page()=
.
>=20
> Suggested-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> Signed-off-by: Deepak R Varma <drv@mailo.com>
> ---

Deepak,

Would you please cite the author of this boiler-plate commit message? I thi=
nk=20
that you are not required by any stated formal rule, however it would be mu=
ch=20
appreciated (by me, at least :-)).

> Changes in v3:
>    - Patch included in the patch series
>=20
> Changes in v2:
>    - None
>=20
>=20
>  fs/gfs2/bmap.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/fs/gfs2/bmap.c b/fs/gfs2/bmap.c
> index 8d611fbcf0bd..6b850e2ba5c8 100644
> --- a/fs/gfs2/bmap.c
> +++ b/fs/gfs2/bmap.c
> @@ -58,12 +58,12 @@ static int gfs2_unstuffer_page(struct gfs2_inode *ip,
> struct buffer_head *dibh, struct inode *inode =3D &ip->i_inode;
>=20
>  =09if (!PageUptodate(page)) {
> -=09=09void *kaddr =3D kmap(page);
> +=09=09void *kaddr =3D kmap_local_page(page);
>  =09=09u64 dsize =3D i_size_read(inode);

As a general rule, we should take the mappings the shorter time it is possi=
ble=20
(to avoid to disable migration for too long). I'm not sure why the "dsize"=
=20
assignment is made between mapping and un-mapping. Can you please explain w=
hy?

Thanks,

Fabio

>  =09=09memcpy(kaddr, dibh->b_data + sizeof(struct gfs2_dinode),=20
dsize);
>  =09=09memset(kaddr + dsize, 0, PAGE_SIZE - dsize);
> -=09=09kunmap(page);
> +=09=09kunmap_local(kaddr);
>=20
>  =09=09SetPageUptodate(page);
>  =09}
> --
> 2.34.1




