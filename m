Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 594C2752528
	for <lists+cluster-devel@lfdr.de>; Thu, 13 Jul 2023 16:33:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689258786;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=EAEgJXo3oFHhbOe/67unGD8n1ytw1uGix+FjoJLnjGY=;
	b=A6vM/+cDem0epomCnQQmaFQkz4D4//7qYMkLh00wevsX45nuA8k64yy98gtaSIiqhldDCM
	5AeyFpQH8vyPJnpmZ9BE7Y15RwmTBvSv7o00qj+IwnzH0pr95cK/cZD7bTDOEiJH5tD284
	oVgreDXNtIAei7THb6aharV1RNPoFQI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-167-8FCD2yVbMuGEF2DhohnwPA-1; Thu, 13 Jul 2023 10:32:57 -0400
X-MC-Unique: 8FCD2yVbMuGEF2DhohnwPA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 656621064C11;
	Thu, 13 Jul 2023 14:32:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 551D6F66DB;
	Thu, 13 Jul 2023 14:32:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0D5F219465A2;
	Thu, 13 Jul 2023 14:32:21 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DDC5B1946589 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 13 Jul 2023 14:32:03 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id AF7F540C206F; Thu, 13 Jul 2023 14:32:03 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A7B0340C2063
 for <cluster-devel@redhat.com>; Thu, 13 Jul 2023 14:32:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AFCF72807D9D
 for <cluster-devel@redhat.com>; Thu, 13 Jul 2023 14:31:15 +0000 (UTC)
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-324-uRaJZiaDNDOKCCgQQ-39gw-1; Thu, 13 Jul 2023 10:30:02 -0400
X-MC-Unique: uRaJZiaDNDOKCCgQQ-39gw-1
Received: by mail-yb1-f197.google.com with SMTP id
 3f1490d57ef6-c5fc972760eso667528276.1
 for <cluster-devel@redhat.com>; Thu, 13 Jul 2023 07:29:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689258557; x=1691850557;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EAEgJXo3oFHhbOe/67unGD8n1ytw1uGix+FjoJLnjGY=;
 b=bs6+1mBkSXP3L8MAQdyTFeKyDSXZ8tm87/Y61LDHqfVeABUf/x9PLqsSb0Q+yKRFC+
 2OwogSf1TGV7FT8pggVw0h9KFxHRlYJ0AH+ocr31yQXmGM6PBXivo/T6vgqtzMGgoWWK
 Y8yKL1o67XgXjtA7/cwSzYvCYS90osbXkz2ZMs425Gd/cbQOZ3Ys59cfACSQIGJNS3KW
 3WTMxsYLTvIvTkFInj0iR1VTGtpYCeiKs6YCshP678sPUknqFwWqu/f1H5BqLfVkGH47
 xqCsSSltsa+fHmdDNezfceGJ+EqmlaDY6mTIT2unDADXh9l1yahttKKhttUS1rs/xay6
 Uu8g==
X-Gm-Message-State: ABy/qLY8B80rNvGKv2Rwpc+wr+4PMVPQlVj3Ck7HD+ltxNVK/mWU/nTj
 +DwDFlcTAMTAUSS7RvkA/7V4VK3c26ncG6VG0u8KE1ZFU2sxtIWQR4KTzcdvBQWP/KoMVob+ZbY
 yln+FcaGUMcLVyaYpD2UVepH2oQXcVN0PxEivGg==
X-Received: by 2002:a17:902:aa05:b0:1b6:93e8:3ddb with SMTP id
 be5-20020a170902aa0500b001b693e83ddbmr1092168plb.6.1689257762252; 
 Thu, 13 Jul 2023 07:16:02 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFBoaT6AgcpqEK/+OjOPi7omBjJbJZjmH2NbMZ6kEeX+GmTB19WcUDmjBsTSqAYSC3VtjzZfK2p0sFXLNEHGc0=
X-Received: by 2002:a17:902:aa05:b0:1b6:93e8:3ddb with SMTP id
 be5-20020a170902aa0500b001b693e83ddbmr1092153plb.6.1689257761981; Thu, 13 Jul
 2023 07:16:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230713135249.153796-1-jlayton@kernel.org>
In-Reply-To: <20230713135249.153796-1-jlayton@kernel.org>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Thu, 13 Jul 2023 16:15:50 +0200
Message-ID: <CAHc6FU6QQicrNDKWMQknP9YqKtEhhL0KbDCLACQ=v8P+tPQ5WQ@mail.gmail.com>
To: Jeff Layton <jlayton@kernel.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: Re: [Cluster-devel] [PATCH] gfs2: fix timestamp handling on quota
 inodes
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
Cc: linux-fsdevel@vger.kernel.org, brauner@kernel.org, cluster-devel@redhat.com,
 linux-kernel@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jeff and Christian,

On Thu, Jul 13, 2023 at 3:52=E2=80=AFPM Jeff Layton <jlayton@kernel.org> wr=
ote:
> While these aren't generally visible from userland, it's best to be
> consistent with timestamp handling. When adjusting the quota, update the
> mtime and ctime like we would with a write operation on any other inode,
> and avoid updating the atime which should only be done for reads.
>
> Signed-off-by: Jeff Layton <jlayton@kernel.org>
> ---
>  fs/gfs2/quota.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> Christian,
>
> Would you mind picking this into the vfs.ctime branch, assuming the GFS2
> maintainers ack it? Andreas and I had discussed this privately, and I
> think it makes sense as part of that series.

Yes, please.

> Thanks,
> Jeff
>
> diff --git a/fs/gfs2/quota.c b/fs/gfs2/quota.c
> index 704192b73605..aa5fd06d47bc 100644
> --- a/fs/gfs2/quota.c
> +++ b/fs/gfs2/quota.c
> @@ -871,7 +871,7 @@ static int gfs2_adjust_quota(struct gfs2_inode *ip, l=
off_t loc,
>                 size =3D loc + sizeof(struct gfs2_quota);
>                 if (size > inode->i_size)
>                         i_size_write(inode, size);
> -               inode->i_mtime =3D inode->i_atime =3D current_time(inode)=
;
> +               inode->i_mtime =3D inode_set_ctime_current(inode);
>                 mark_inode_dirty(inode);
>                 set_bit(QDF_REFRESH, &qd->qd_flags);
>         }
> --
> 2.41.0
>

Reviewed-by: Andreas Gruenbacher <agruenba@redhat.com>

Thanks,
Andreas

