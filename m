Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DEF36E64AB
	for <lists+cluster-devel@lfdr.de>; Tue, 18 Apr 2023 14:51:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681822288;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+FQ5WvFSlNP/FSMCJFsRwFCN1W/qvxRj1T4AlLX107I=;
	b=jNBGJ+IOHqHS1zyG3fARMXtJb+NO4yZnPY8hRNRypHeofwS/fedBuSYZ5o+j8rZirH+kYk
	a5Y1mCX4PWO2/qzKFtdsc2dbngB4w2awefksyNWIk7jLPh+sKLugxzaTiwgTojOZP8yERk
	b0N5p6BVp7GVnqGKKc+sjLlxDY8mcvw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-255-xuGcwWp5MK6951BWt5gDaQ-1; Tue, 18 Apr 2023 08:51:25 -0400
X-MC-Unique: xuGcwWp5MK6951BWt5gDaQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7BF6D858F09;
	Tue, 18 Apr 2023 12:51:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3B9C9492C3E;
	Tue, 18 Apr 2023 12:51:23 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9D6A619465A0;
	Tue, 18 Apr 2023 12:51:22 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 02918194658F for <cluster-devel@listman.corp.redhat.com>;
 Tue, 18 Apr 2023 12:51:21 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E641A1121315; Tue, 18 Apr 2023 12:51:21 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DF0131121314
 for <cluster-devel@redhat.com>; Tue, 18 Apr 2023 12:51:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C09428996E8
 for <cluster-devel@redhat.com>; Tue, 18 Apr 2023 12:51:21 +0000 (UTC)
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-277-RagHAb6DMp24CzYLvjDeAQ-1; Tue, 18 Apr 2023 08:51:20 -0400
X-MC-Unique: RagHAb6DMp24CzYLvjDeAQ-1
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-1a63605611eso15646065ad.2
 for <cluster-devel@redhat.com>; Tue, 18 Apr 2023 05:51:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681822278; x=1684414278;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+FQ5WvFSlNP/FSMCJFsRwFCN1W/qvxRj1T4AlLX107I=;
 b=gaEy1NPXIDZLY4N0ETDsoylcE4H8OxAGOLkxvjMYleUbNMu9j9TNILZ0GKAyljAqNw
 oOtnUANKnlTrIFJtwDCkjbPHvmu1bvMCFOVk7C0FHkoZQKHpgj69oPBW74asiuvdOKsF
 cWpS1D/hKdahsr8G4BtbGvONGxLT28z+07w7Z0m/ku6sxL6biME7HkigsA5AHeLFsnhf
 M43zJDw4QKP9w98Vw4nLWp5yFvqfISoKF1BRe/XxJjzxI8CPVMMl0nJLEkmUZNfF52HC
 U9GKsXrTURztCVR9nevZKdyhDf5X5xkyTmlQz0qdRwFXu3aYa26Fv4bRDvKMZ6C8VHcX
 d3Vg==
X-Gm-Message-State: AAQBX9ciq1SYjm7Oo1hwudJyuTj+28sEsDr90QL9rZv/RieQV9Srcqb+
 fybbx7+Z8YIDvVXDhpBjXgS0IMHy8sckOmKl30BqQXns8Dj+t2d0yzAdAHPEl7g+EBFX4ktV8Um
 X2JIGgNjMcbi71Wsb+7SpZB0sn8dq8PyEYFm9btLxvT2lKA==
X-Received: by 2002:a17:902:e1cd:b0:1a2:1fd0:226c with SMTP id
 t13-20020a170902e1cd00b001a21fd0226cmr719818pla.8.1681822278320; 
 Tue, 18 Apr 2023 05:51:18 -0700 (PDT)
X-Google-Smtp-Source: AKy350YqokUIE8shBPlXsyt52/Qsmk7T772mS5utILkVKfAaVUVlU/X2DsS4DP4/uPjlAIOFuF+rubUQ3cedwhC1UjM=
X-Received: by 2002:a17:902:e1cd:b0:1a2:1fd0:226c with SMTP id
 t13-20020a170902e1cd00b001a21fd0226cmr719813pla.8.1681822278011; Tue, 18 Apr
 2023 05:51:18 -0700 (PDT)
MIME-Version: 1.0
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
 <5800e1f5-8681-e140-fef0-8b2c3b4b6efa@web.de>
In-Reply-To: <5800e1f5-8681-e140-fef0-8b2c3b4b6efa@web.de>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Tue, 18 Apr 2023 14:51:05 +0200
Message-ID: <CAHc6FU4RekTwC9jH-H898PCyufrE59NYqZWy_V3p7R7dOCaTDA@mail.gmail.com>
To: Markus Elfring <Markus.Elfring@web.de>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: Re: [Cluster-devel] [PATCH] gfs2: Move a variable assignment behind
 a null pointer check in inode_go_dump()
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
Cc: cluster-devel@redhat.com, kernel-janitors@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, cocci@inria.fr
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Markus,

On Thu, Apr 13, 2023 at 9:23=E2=80=AFPM Markus Elfring <Markus.Elfring@web.=
de> wrote:
> Date: Thu, 13 Apr 2023 20:54:30 +0200
>
> The address of a data structure member was determined before
> a corresponding null pointer check in the implementation of
> the function =E2=80=9Cinode_go_dump=E2=80=9D.
>
> Thus avoid the risk for undefined behaviour by moving the assignment
> for the variable =E2=80=9Cinode=E2=80=9D behind the null pointer check.
>
> This issue was detected by using the Coccinelle software.
>
> Fixes: 27a2660f1ef944724956d92e8a312b6da0936fae ("gfs2: Dump nrpages for =
inodes and their glocks")

Okay, that's a worthwhile cleanup. It doesn't actually fix a bug, so
I'm not going to add a Fixes tag, though.

> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  fs/gfs2/glops.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
> index b65950e76be5..6e33c8058059 100644
> --- a/fs/gfs2/glops.c
> +++ b/fs/gfs2/glops.c
> @@ -535,12 +535,13 @@ static void inode_go_dump(struct seq_file *seq, str=
uct gfs2_glock *gl,
>                           const char *fs_id_buf)
>  {
>         struct gfs2_inode *ip =3D gl->gl_object;
> -       struct inode *inode =3D &ip->i_inode;
> +       struct inode *inode;
>         unsigned long nrpages;
>
>         if (ip =3D=3D NULL)
>                 return;
>
> +       inode =3D &ip->i_inode;
>         xa_lock_irq(&inode->i_data.i_pages);
>         nrpages =3D inode->i_data.nrpages;
>         xa_unlock_irq(&inode->i_data.i_pages);
> --
> 2.40.0
>

Thanks,
Andreas

