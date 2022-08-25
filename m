Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2675A1647
	for <lists+cluster-devel@lfdr.de>; Thu, 25 Aug 2022 18:01:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661443266;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=UVmU0JlobEOhqS/uYFvC6XTJZVXzM+OTi8XG4ENSz88=;
	b=QmyKR59hTCz9fepTtvcLCCmbPwxdL4pJjhjKmUbgf79diXgGOtgQ0cDJUopJ1x4TLDmsRi
	JIpQYMXOo8MJhKklGldDjdyBeji+ZECOeQrEmhFWKgVUs8LLuYjL+5GTtyghJyrtSH/VeW
	2XYL9AMW9YdUClnhhL4uKh/sD52Bb0c=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-623-GMth_D0LMRGEGpYq-K3ZAw-1; Thu, 25 Aug 2022 12:00:12 -0400
X-MC-Unique: GMth_D0LMRGEGpYq-K3ZAw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5379C1C13953;
	Thu, 25 Aug 2022 16:00:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 47FCF2026D4C;
	Thu, 25 Aug 2022 16:00:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 13E991946A5E;
	Thu, 25 Aug 2022 16:00:11 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 750781946A5A for <cluster-devel@listman.corp.redhat.com>;
 Thu, 25 Aug 2022 16:00:10 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6906D4042F01; Thu, 25 Aug 2022 16:00:10 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 657B740CF8ED
 for <cluster-devel@redhat.com>; Thu, 25 Aug 2022 16:00:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4AA79805AF5
 for <cluster-devel@redhat.com>; Thu, 25 Aug 2022 16:00:10 +0000 (UTC)
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-649-3ihNPQgaMwuygSN6FTUEtw-1; Thu, 25 Aug 2022 12:00:08 -0400
X-MC-Unique: 3ihNPQgaMwuygSN6FTUEtw-1
Received: by mail-pj1-f72.google.com with SMTP id
 na5-20020a17090b4c0500b001fb464b4761so3669246pjb.1
 for <cluster-devel@redhat.com>; Thu, 25 Aug 2022 09:00:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=UVmU0JlobEOhqS/uYFvC6XTJZVXzM+OTi8XG4ENSz88=;
 b=58VmHlsZsVRXrk38LO+MKide2it+oaF3n1R+NZEDVgmi6x3OuSGfG4hAER8PSq725i
 fuVUle4cqu4lopgQOB+HPY+nynuuCqjNVM/9f0O5X9+xTSNz7yfKc1Gcxp0obHQlvWjQ
 bszH5yhf6aIW+BbDLzNP1DYQY1unmMNLydU2efvZg9GV62yEOrCeIzl7PDbk9r1wnrad
 oc65r3at9BfJuVF54YaVfUpHYWwdInOm+tnUb32ttg9uUB2dJgbx0TrSzPJUgR9Cpo+X
 GSCwqma6msrjlk0Sfyuo1M1++TZWjz3968rElJ01NY4ypKER5JAN1Cxk8C3aOKRdE2Xh
 f/OA==
X-Gm-Message-State: ACgBeo3+uMd9wPBcoY13DHd4Rr0N5VNZN1eJxXSBLZgRfPoYfbB+c27H
 OeI8AUNpnk/bSVCklM53p3Nue60dxtVUadJdn4eDJU+tC4qyRjYTLxixkoEdx3ayUz0P5Dw+iq1
 MwnZkD68UkjjqYdpZ6A3B3caMq3g7fQqPQyF3eQ==
X-Received: by 2002:a65:6e49:0:b0:429:cae6:aac6 with SMTP id
 be9-20020a656e49000000b00429cae6aac6mr3744254pgb.268.1661443207680; 
 Thu, 25 Aug 2022 09:00:07 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6TyN6D7iyq+KldydMaWXHAG9Z0It2CMlQHHdXn2Ielj16Bv0Bok+nsyj5qJ27Ltn1ijZY2Vy6sieEQ/TAbAlw=
X-Received: by 2002:a65:6e49:0:b0:429:cae6:aac6 with SMTP id
 be9-20020a656e49000000b00429cae6aac6mr3744228pgb.268.1661443207349; Thu, 25
 Aug 2022 09:00:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220825145348.382382-1-rpeterso@redhat.com>
In-Reply-To: <20220825145348.382382-1-rpeterso@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Thu, 25 Aug 2022 17:59:56 +0200
Message-ID: <CAHc6FU7m__ttofsfY8KC3frEDVsi98JkSa_0rt++kc61LTAo3Q@mail.gmail.com>
To: Bob Peterson <rpeterso@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Subject: Re: [Cluster-devel] [PATCH] gfs2: Use TRY lock in gfs2_inode_lookup
 for UNLINKED inodes
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
Cc: cluster-devel <cluster-devel@redhat.com>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 25, 2022 at 4:53 PM Bob Peterson <rpeterso@redhat.com> wrote:
> Before this patch, delete_work_func() would check for the GLF_DEMOTE
> flag on the iopen glock and if set, it would perform special processing.
> However, there was a race whereby the GLF_DEMOTE flag could be set by
> another process after the check. Then when it called
> gfs2_lookup_by_inum() which calls gfs2_inode_lookup(), it tried to lock
> the iopen glock in SH mode, but the GLF_DEMOTE flag prevented the
> request from being granted. But the iopen glock could never be demoted
> because that happens when the inode is evicted, and the evict was never
> completed because of the failed lookup.
>
> To fix that, change function gfs2_inode_lookup() so that when
> GFS2_BLKST_UNLINKED inodes are searched, it uses the LM_FLAG_TRY flag
> for the iopen glock.  If the locking request fails, fail
> gfs2_inode_lookup() with -EAGAIN so that delete_work_func() can retry
> the operation later.
>
> Signed-off-by: Bob Peterson <rpeterso@redhat.com>
> Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
> ---
>  fs/gfs2/glock.c |  8 +++++---
>  fs/gfs2/inode.c | 10 ++++++++--
>  2 files changed, 13 insertions(+), 5 deletions(-)
>
> diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
> index 0b36a16659b6..f1973a442955 100644
> --- a/fs/gfs2/glock.c
> +++ b/fs/gfs2/glock.c
> @@ -1018,16 +1018,18 @@ static void delete_work_func(struct work_struct *work)
>                         if (gfs2_queue_delete_work(gl, 5 * HZ))
>                                 return;
>                 }
> -               goto out;
>         }
>
>         inode = gfs2_lookup_by_inum(sdp, no_addr, gl->gl_no_formal_ino,
>                                     GFS2_BLKST_UNLINKED);
> -       if (!IS_ERR_OR_NULL(inode)) {
> +       if (IS_ERR(inode)) {
> +               if (PTR_ERR(inode) == -EAGAIN &&
> +                       (gfs2_queue_delete_work(gl, 5 * HZ)))
> +                               return;
> +       } else {
>                 d_prune_aliases(inode);
>                 iput(inode);
>         }
> -out:
>         gfs2_glock_put(gl);
>  }
>
> diff --git a/fs/gfs2/inode.c b/fs/gfs2/inode.c
> index c8ec876f33ea..56ded979988c 100644
> --- a/fs/gfs2/inode.c
> +++ b/fs/gfs2/inode.c
> @@ -130,6 +130,7 @@ struct inode *gfs2_inode_lookup(struct super_block *sb, unsigned int type,
>         if (inode->i_state & I_NEW) {
>                 struct gfs2_sbd *sdp = GFS2_SB(inode);
>                 struct gfs2_glock *io_gl;
> +               int extra_flags = 0;
>
>                 error = gfs2_glock_get(sdp, no_addr, &gfs2_inode_glops, CREATE,
>                                        &ip->i_gl);
> @@ -141,9 +142,12 @@ struct inode *gfs2_inode_lookup(struct super_block *sb, unsigned int type,
>                 if (unlikely(error))
>                         goto fail;
>
> -               if (blktype != GFS2_BLKST_UNLINKED)
> +               if (blktype == GFS2_BLKST_UNLINKED)
> +                       extra_flags |= LM_FLAG_TRY;
> +               else
>                         gfs2_cancel_delete_work(io_gl);
> -               error = gfs2_glock_nq_init(io_gl, LM_ST_SHARED, GL_EXACT,
> +               error = gfs2_glock_nq_init(io_gl, LM_ST_SHARED,
> +                                          GL_EXACT | extra_flags,
>                                            &ip->i_iopen_gh);
>                 gfs2_glock_put(io_gl);
>                 if (unlikely(error))
> @@ -210,6 +214,8 @@ struct inode *gfs2_inode_lookup(struct super_block *sb, unsigned int type,
>         return inode;
>
>  fail:
> +       if (error == GLR_TRYFAILED)
> +               error = -EAGAIN;
>         if (gfs2_holder_initialized(&ip->i_iopen_gh))
>                 gfs2_glock_dq_uninit(&ip->i_iopen_gh);
>         if (gfs2_holder_initialized(&i_gh))
> --
> 2.37.2
>

Pushed to for-next.

Thanks,
Andreas

