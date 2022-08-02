Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 24343587E5B
	for <lists+cluster-devel@lfdr.de>; Tue,  2 Aug 2022 16:47:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1659451668;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=8913fqrTgN/UIafQ7uUJ+klCcDi1NTu0FfS6Y8Lyg0M=;
	b=ItpVK/mF6oTeuVLsB2WQeBDX75889mUELr3WM1J43a70fzTJXhaCIYCYfP90Qj2My4Y6Sm
	UykPLZ6y+K+AhXiftSoAaqwe7DpTcm2p88uTifNWi0Vkjf5dWhX1pHpYfE+zuSrdFqHcXT
	BGreaHndWAbN2a50VFsgEpkKbVIj7r0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-159-qIdGIgQrNZqEdvCZReIPnA-1; Tue, 02 Aug 2022 10:47:44 -0400
X-MC-Unique: qIdGIgQrNZqEdvCZReIPnA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 85DBE85A5B9;
	Tue,  2 Aug 2022 14:47:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 38DA51121319;
	Tue,  2 Aug 2022 14:47:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E11DC1946A50;
	Tue,  2 Aug 2022 14:47:42 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6AE711946A50 for <cluster-devel@listman.corp.redhat.com>;
 Tue,  2 Aug 2022 14:47:41 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 520E9401E5C; Tue,  2 Aug 2022 14:47:41 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E8C0492C3B
 for <cluster-devel@redhat.com>; Tue,  2 Aug 2022 14:47:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7C52B3815D32
 for <cluster-devel@redhat.com>; Tue,  2 Aug 2022 14:47:40 +0000 (UTC)
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-654-CodF7rL9MqCxAtz2i20HHA-1; Tue, 02 Aug 2022 10:47:39 -0400
X-MC-Unique: CodF7rL9MqCxAtz2i20HHA-1
Received: by mail-pj1-f72.google.com with SMTP id
 o3-20020a17090a0a0300b001f3112a9f1cso6273625pjo.8
 for <cluster-devel@redhat.com>; Tue, 02 Aug 2022 07:47:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8913fqrTgN/UIafQ7uUJ+klCcDi1NTu0FfS6Y8Lyg0M=;
 b=pLd2JGtS1Nu2ij0T6aSDr8cVpKddk59PCQH4mIsZOf0H75WEK6vGRC77tQpAnt6qRK
 yYGZJDNaTwt+R3ebI/5YlF7uenEcQ11WFl8EqnvCcM3u5jv78JfJ0tBqqAoBRNSuLHRi
 pbSEkm/zBqi/gcFzHW/VvH8V6KHosZd6WnDgWDhVNLydDrtcqgcAmVwJv5sR7MnOIlqP
 yda35QMO5ZSqu3CufgviDjj/4zrmTNR7gZmPzI+exSLjH2F8Eoh4PgD2wK9ysHIbB5by
 XgxrRZa4cbWoU07wydT61DqlN9dZ4YUGTUBNhrILxgMThj/CtRFYPXlHcGfyo90XHlVw
 o8iA==
X-Gm-Message-State: ACgBeo16EIj9zLumy2TvwrEgJbhxEy81xQ5w9FuFeYypo3d7Wp8vR4Nh
 Tjj/NaFQu3sm1DzisqnHNzC9L9t39sWLCJHRXVFPG5cQFlptOsU/1QHWh8uRm3fsgofrVxKHw6u
 roSFhhpuQU6XrIEkg/XHKzNxyntyWMaOaQkLEfw==
X-Received: by 2002:a17:902:f70c:b0:16d:20ef:7e42 with SMTP id
 h12-20020a170902f70c00b0016d20ef7e42mr21757756plo.54.1659451658078; 
 Tue, 02 Aug 2022 07:47:38 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7KMMd1bsRtXzmWjOV2sDx56p6aP6nEhVKTrKklyahBKGpp6M0d/NuJ5Pfs0yZ+RnEgOakTSdGdGAYmwj7tvhk=
X-Received: by 2002:a17:902:f70c:b0:16d:20ef:7e42 with SMTP id
 h12-20020a170902f70c00b0016d20ef7e42mr21757732plo.54.1659451657794; Tue, 02
 Aug 2022 07:47:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220727160222.227803-1-rpeterso@redhat.com>
 <20220727160222.227803-3-rpeterso@redhat.com>
In-Reply-To: <20220727160222.227803-3-rpeterso@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Tue, 2 Aug 2022 16:47:26 +0200
Message-ID: <CAHc6FU5kk1+v+xKWd8X4eMkX7w7KtFGk+MxCYuTQ3AcoWY87SA@mail.gmail.com>
To: Bob Peterson <rpeterso@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Subject: Re: [Cluster-devel] [PATCH 2/3] gfs2: Dequeue waiters when withdrawn
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 27, 2022 at 6:24 PM Bob Peterson <rpeterso@redhat.com> wrote:
> When a withdraw occurs, ordinary (not system) glocks may not be granted
> anymore. This patch takes measures to remove any pending waiters from
> the glocks that will never be granted.

You kind of explain why this patch is useful in the cover letter, but
not here. Could you please add that description here?

Thanks,
Andreas

> Signed-off-by: Bob Peterson <rpeterso@redhat.com>
> ---
>  fs/gfs2/glock.c | 14 ++++++++++++++
>  fs/gfs2/glock.h |  1 +
>  fs/gfs2/util.c  |  5 +++++
>  3 files changed, 20 insertions(+)
>
> diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
> index e540d1290099..0bfecffd71f1 100644
> --- a/fs/gfs2/glock.c
> +++ b/fs/gfs2/glock.c
> @@ -2223,6 +2223,20 @@ static void dump_glock_func(struct gfs2_glock *gl)
>         dump_glock(NULL, gl, true);
>  }
>
> +static void withdraw_dq(struct gfs2_glock *gl)
> +{
> +       spin_lock(&gl->gl_lockref.lock);
> +       if (!__lockref_is_dead(&gl->gl_lockref) &&
> +           glock_blocked_by_withdraw(gl))
> +               do_error(gl, LM_OUT_ERROR); /* remove pending waiters */
> +       spin_unlock(&gl->gl_lockref.lock);
> +}
> +
> +void gfs2_gl_dq_holders(struct gfs2_sbd *sdp)
> +{
> +       glock_hash_walk(withdraw_dq, sdp);
> +}
> +
>  /**
>   * gfs2_gl_hash_clear - Empty out the glock hash table
>   * @sdp: the filesystem
> diff --git a/fs/gfs2/glock.h b/fs/gfs2/glock.h
> index c0ae9100a0bc..d6fc449aa7ff 100644
> --- a/fs/gfs2/glock.h
> +++ b/fs/gfs2/glock.h
> @@ -273,6 +273,7 @@ extern void gfs2_cancel_delete_work(struct gfs2_glock *gl);
>  extern bool gfs2_delete_work_queued(const struct gfs2_glock *gl);
>  extern void gfs2_flush_delete_work(struct gfs2_sbd *sdp);
>  extern void gfs2_gl_hash_clear(struct gfs2_sbd *sdp);
> +extern void gfs2_gl_dq_holders(struct gfs2_sbd *sdp);
>  extern void gfs2_glock_finish_truncate(struct gfs2_inode *ip);
>  extern void gfs2_glock_thaw(struct gfs2_sbd *sdp);
>  extern void gfs2_glock_add_to_lru(struct gfs2_glock *gl);
> diff --git a/fs/gfs2/util.c b/fs/gfs2/util.c
> index 78cb12d0fba1..acf94c83b29b 100644
> --- a/fs/gfs2/util.c
> +++ b/fs/gfs2/util.c
> @@ -164,6 +164,11 @@ static void signal_our_withdraw(struct gfs2_sbd *sdp)
>                 }
>                 if (!ret)
>                         gfs2_make_fs_ro(sdp);
> +               /*
> +                * Dequeue any pending non-system glock holders that can no
> +                * longer be granted because the file system is withdrawn.
> +                */
> +               gfs2_gl_dq_holders(sdp);
>                 gfs2_freeze_unlock(&freeze_gh);
>         }
>
> --
> 2.36.1
>

