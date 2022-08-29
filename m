Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A815A4D02
	for <lists+cluster-devel@lfdr.de>; Mon, 29 Aug 2022 15:07:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661778434;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=U/ZhGNt5Ta3DC5jnmftmKv//7cDgUqEj6l/eHuUl6A4=;
	b=XBCu095i9488MRZl4OcG+TY7CjGknkoO5lN3nfyadrPIYa6MGauKnT7tDMXq3aex+BzGKl
	S/MKgT3x7nADLA5NUYRof8ADN7bGImVLVajykFXFF1inUUjrvbW1fy8ktVmbluaK9rCatN
	qHH0+X6Uju0DTOuZWlkxN85VdGnYQyo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-652--9wlLPbNMPuNwRF7tAz2Cw-1; Mon, 29 Aug 2022 09:07:09 -0400
X-MC-Unique: -9wlLPbNMPuNwRF7tAz2Cw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 177711818805;
	Mon, 29 Aug 2022 13:07:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1855C1121314;
	Mon, 29 Aug 2022 13:07:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D8B721946A49;
	Mon, 29 Aug 2022 13:07:05 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id ED5861946A40 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 29 Aug 2022 13:07:04 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id CE09740315A; Mon, 29 Aug 2022 13:07:04 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CA606492C3B
 for <cluster-devel@redhat.com>; Mon, 29 Aug 2022 13:07:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AFEFF811E76
 for <cluster-devel@redhat.com>; Mon, 29 Aug 2022 13:07:04 +0000 (UTC)
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-127-FhsKqrAWPZ2c8k9K_aziEg-1; Mon, 29 Aug 2022 09:07:03 -0400
X-MC-Unique: FhsKqrAWPZ2c8k9K_aziEg-1
Received: by mail-qk1-f198.google.com with SMTP id
 bm11-20020a05620a198b00b006bb2388ef0cso6493660qkb.5
 for <cluster-devel@redhat.com>; Mon, 29 Aug 2022 06:07:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=U/ZhGNt5Ta3DC5jnmftmKv//7cDgUqEj6l/eHuUl6A4=;
 b=LKG2NWFzUo+0maRmzLvuUxTLQ/xNTlkUKOUsc7tgVg90cp/LWW5tC75b9tHr+k1J/h
 SPdxq192Mi8AoWuI7UDrG1sK6tmSQZSFVtIKz4EHvtZtCnvq9QhYoe5GzKnxO0Afmx1M
 mRoaoPNjbdjGL4MSuxspDNnE7mDydDCgkC3G4d9l4Lgccc956qKm4tePTEoBwECjB1P2
 Ku5CnPxXzM4NQfJDvVNKYZu39DvfLUPoOOHEtGtf/Ewt4UX8vtU++9QRMe1aF9sWb38k
 EQK1QGdLrsDTVbx8YNhxrKdbzKpLuFIPOXID2D/mpva9jI2uXhQQDGSjwZpRLu51dAB7
 vbYA==
X-Gm-Message-State: ACgBeo176QUoIetpZ2mBFb1hMP0hS5oL4PM+wcwCrl38B4GBYQw/zwOo
 cLjNz/dVh08YBdvYh3yxsBqWGs44yCuBfOm35bF5ub1TT0G16/90OSpX3/SHK+HY7IAgbZxp4nt
 ZtaAZdqFKNZqc7gFgmnxGQIUbjf2V6tEPVH3rOg==
X-Received: by 2002:a05:6214:1bce:b0:499:504:7631 with SMTP id
 m14-20020a0562141bce00b0049905047631mr2376157qvc.92.1661778422546; 
 Mon, 29 Aug 2022 06:07:02 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4qzSlPJoAm6595i3269QVT939xP0c6etFe8aPNtIPfIqJFhIekEgfOhE55OcEGhpcWjD+UmLVPsACgH29xbbc=
X-Received: by 2002:a05:6214:1bce:b0:499:504:7631 with SMTP id
 m14-20020a0562141bce00b0049905047631mr2376133qvc.92.1661778422249; Mon, 29
 Aug 2022 06:07:02 -0700 (PDT)
MIME-Version: 1.0
References: <YwxtqfWnuiCJkVQ0@kili>
In-Reply-To: <YwxtqfWnuiCJkVQ0@kili>
From: Alexander Aring <aahringo@redhat.com>
Date: Mon, 29 Aug 2022 09:06:51 -0400
Message-ID: <CAK-6q+jTAXAgbN=h+CFXpq+JE-=jhnXSG2V4ZegZC7HMxLD6MQ@mail.gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Subject: Re: [Cluster-devel] [bug report] fs: dlm: trace user space callbacks
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
Cc: cluster-devel <cluster-devel@redhat.com>,
 Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi,

On Mon, Aug 29, 2022 at 3:41 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> Hello Alexander Aring,
>
> The patch 7a3de7324c2b: "fs: dlm: trace user space callbacks" from
> Aug 15, 2022, leads to the following Smatch static checker warning:
>
>         fs/dlm/lock.c:5900 dlm_user_request()
>         warn: 'lkb' was already freed.
>
> fs/dlm/lock.c
>     5832 int dlm_user_request(struct dlm_ls *ls, struct dlm_user_args *ua,
>     5833                      int mode, uint32_t flags, void *name, unsigned int namelen)
>     5834 #endif
>     5835 {
>     5836         struct dlm_lkb *lkb;
>     5837         struct dlm_args args;
>     5838         int error;
>     5839
>     5840         dlm_lock_recovery(ls);
>     5841
>     5842         error = create_lkb(ls, &lkb);
>     5843         if (error) {
>     5844                 kfree(ua);
>     5845                 goto out;
>     5846         }
>     5847
>     5848         trace_dlm_lock_start(ls, lkb, name, namelen, mode, flags);
>     5849
>     5850         if (flags & DLM_LKF_VALBLK) {
>     5851                 ua->lksb.sb_lvbptr = kzalloc(DLM_USER_LVB_LEN, GFP_NOFS);
>     5852                 if (!ua->lksb.sb_lvbptr) {
>     5853                         kfree(ua);
>     5854                         __put_lkb(ls, lkb);
>     5855                         error = -ENOMEM;
>     5856                         goto out_trace_end;
>     5857                 }
>     5858         }
>     5859 #ifdef CONFIG_DLM_DEPRECATED_API
>     5860         error = set_lock_args(mode, &ua->lksb, flags, namelen, timeout_cs,
>     5861                               fake_astfn, ua, fake_bastfn, &args);
>     5862 #else
>     5863         error = set_lock_args(mode, &ua->lksb, flags, namelen, fake_astfn, ua,
>     5864                               fake_bastfn, &args);
>     5865 #endif
>     5866         if (error) {
>     5867                 kfree(ua->lksb.sb_lvbptr);
>     5868                 ua->lksb.sb_lvbptr = NULL;
>     5869                 kfree(ua);
>     5870                 __put_lkb(ls, lkb);
>     5871                 goto out_trace_end;
>     5872         }
>     5873
>     5874         /* After ua is attached to lkb it will be freed by dlm_free_lkb().
>     5875            When DLM_IFL_USER is set, the dlm knows that this is a userspace
>     5876            lock and that lkb_astparam is the dlm_user_args structure. */
>     5877         lkb->lkb_flags |= DLM_IFL_USER;
>     5878         error = request_lock(ls, lkb, name, namelen, &args);
>     5879
>     5880         switch (error) {
>     5881         case 0:
>     5882                 break;
>     5883         case -EINPROGRESS:
>     5884                 error = 0;
>     5885                 break;
>     5886         case -EAGAIN:
>     5887                 error = 0;
>     5888                 fallthrough;
>     5889         default:
>     5890                 __put_lkb(ls, lkb);
>     5891                 goto out_trace_end;
>     5892         }
>     5893
>     5894         /* add this new lkb to the per-process list of locks */
>     5895         spin_lock(&ua->proc->locks_spin);
>     5896         hold_lkb(lkb);
>     5897         list_add_tail(&lkb->lkb_ownqueue, &ua->proc->locks);
>     5898         spin_unlock(&ua->proc->locks_spin);
>     5899  out_trace_end:
> --> 5900         trace_dlm_lock_end(ls, lkb, name, namelen, mode, flags, error, false);
>                                         ^^^
> This is freed, but probably the trace code doesn't care?  I'm not sure.
>

Thanks. It cares, there is currently an issue. We need to rearrange
the code there so we don't have any use after free here.

However the user has to opt-in.

- Alex

