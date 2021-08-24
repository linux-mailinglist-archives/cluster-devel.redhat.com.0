Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8C4B63F6BB4
	for <lists+cluster-devel@lfdr.de>; Wed, 25 Aug 2021 00:28:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1629844083;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=+BRhUuELpwpVU5ZviBJO2rkGPThKWrKczyY/9rPfoiQ=;
	b=PEzzRqPF8LUW3P5cJBeLMHdlhwmfEaqcVaA200s1qbHz484/vAZ0h66lhdi4xOVxgboGEU
	DhpmdwMSVO0KEUabmum99+SM1+9QMW9FUJUHZXQ5eod14jHlRdnYvaxI+mvx7SUcTrOlUZ
	hxX709Lg7t5Oo2FoT12yKaRt9dnJVQ4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-596-NL9a-TngMLuI6vLOQ23aMg-1; Tue, 24 Aug 2021 18:28:02 -0400
X-MC-Unique: NL9a-TngMLuI6vLOQ23aMg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 653261853024;
	Tue, 24 Aug 2021 22:28:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D3CF01893C;
	Tue, 24 Aug 2021 22:27:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9EEF6181A0F0;
	Tue, 24 Aug 2021 22:27:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17OMRoNC012342 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 24 Aug 2021 18:27:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9FF0311558A3; Tue, 24 Aug 2021 22:27:50 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9BA331155896
	for <cluster-devel@redhat.com>; Tue, 24 Aug 2021 22:27:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 45E18101A54C
	for <cluster-devel@redhat.com>; Tue, 24 Aug 2021 22:27:47 +0000 (UTC)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
	[209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-93-hfnUqipBORmf2uYYTjpXaQ-1; Tue, 24 Aug 2021 18:27:45 -0400
X-MC-Unique: hfnUqipBORmf2uYYTjpXaQ-1
Received: by mail-wm1-f69.google.com with SMTP id
	j33-20020a05600c1c21b02902e6828f7a20so1381404wms.7
	for <cluster-devel@redhat.com>; Tue, 24 Aug 2021 15:27:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=+BRhUuELpwpVU5ZviBJO2rkGPThKWrKczyY/9rPfoiQ=;
	b=NJrcSx0xray8pN5JJRgIE4Z/qUOFU34Y+oKngy0Qfs0HoOLchsplxfw0zwOyA1omh6
	U0xsgqn+t+ehOG1fWRT8gaQ0R3GX2c27WHy/rueSJOHmg6ia3o3Z3M28ut9Hz+LD8YdO
	hKgBSMZDAlTK52uHk+11o0FwdfSJLPVe/XrqSge2fY5RTkxNUSWWNfoDyoDHDerUxhdg
	FF1yKfH8iBino6Ie1cxvQXeXn1pVKeMQtMVWyRTD3xlUlV0eOjoZm2dO4o/CE9eTDye1
	zMlUY526ni++Mx6oiuh75hrqmzLK4ofWjGb634K7u+/KjW0lUcqPRjvddLbYjfekY8lu
	gLxg==
X-Gm-Message-State: AOAM530wNjknryOMBYMMMnRuKMsBg+QWAatzf/02YKx6sb8z9/08Ogji
	lId1I/u5+dG/74S21jIsi3mjBLfiiuYapwjtRQ6utfMswbpGTHvXjiX6qlCHw07O2O2Mok6YhLE
	5+sfhtC3MkBm05FNbq3MSykWQ2cMUQ8+tXnUjcg==
X-Received: by 2002:adf:e28a:: with SMTP id v10mr21189397wri.289.1629844064692;
	Tue, 24 Aug 2021 15:27:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzdK1mwZ7F5SWYuCC+ZPVBT3/J4p5K9yvOxV+Xn0Kd6SwoIu4QYhyLUpiQOtRLAYeRQjpQgUlYo4NoiEEkQce4=
X-Received: by 2002:adf:e28a:: with SMTP id v10mr21189392wri.289.1629844064528;
	Tue, 24 Aug 2021 15:27:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210824140241.149386-1-rpeterso@redhat.com>
	<20210824140241.149386-2-rpeterso@redhat.com>
	<CAHc6FU7SLAyoMc828JPAjb_z9YBM=dESDA3Lir5HWRt0e6ri3Q@mail.gmail.com>
	<26cea225-e7c4-bf96-57a2-5416ffb7d8c2@redhat.com>
In-Reply-To: <26cea225-e7c4-bf96-57a2-5416ffb7d8c2@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Wed, 25 Aug 2021 00:27:33 +0200
Message-ID: <CAHc6FU4bae8A6LaXWHO2sWcN9-PBC3bjyydjefggXCYsuCHzJw@mail.gmail.com>
To: Bob Peterson <rpeterso@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [GFS2 PATCH 1/3] gfs2: switch go_xmote_bh glop
 to pass gh not gl
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 24, 2021 at 6:48 PM Bob Peterson <rpeterso@redhat.com> wrote:
> On 8/24/21 11:12 AM, Andreas Gruenbacher wrote:
> > On Tue, Aug 24, 2021 at 4:02 PM Bob Peterson <rpeterso@redhat.com> wrote:
> >> Before this patch, the go_xmote_bh function was passed gl, the glock
> >> pointer. This patch switches it to gh, the holder, which points to the gl.
> >> This facilitates improvements for the next patch.
> >>
> >> Signed-off-by: Bob Peterson <rpeterso@redhat.com>
> >> ---
> >>   fs/gfs2/glock.c  | 4 ++--
> >>   fs/gfs2/glops.c  | 5 +++--
> >>   fs/gfs2/incore.h | 2 +-
> >>   3 files changed, 6 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
> >> index e0eaa9cf9fb6..d43eed1696ab 100644
> >> --- a/fs/gfs2/glock.c
> >> +++ b/fs/gfs2/glock.c
> >> @@ -562,9 +562,9 @@ static void finish_xmote(struct gfs2_glock *gl, unsigned int ret)
> >>          if (test_and_clear_bit(GLF_DEMOTE_IN_PROGRESS, &gl->gl_flags))
> >>                  gfs2_demote_wake(gl);
> >>          if (state != LM_ST_UNLOCKED) {
> >> -               if (glops->go_xmote_bh) {
> >> +               if (gh && glops->go_xmote_bh) {
> >
> > This changes when the callback is called. Please explain why that's okay.
>
> This is okay because patch 3 eliminates go_xmote_bh() completely anyway.
> I just threw the "gh &&" as an abundance of precaution.

I didn't mean this as a joke. This patch changes when the go_xmote_bh
hook is called, and there is no mention why that's a safe thing to do.
Then the go_xmote_bh hook is removed in favor of go_lock, which is yet
called under different circumstances, and again there is no mention
why that doesn't matter and we still end up calling freeze_go_xmote_bh
(now freeze_go_lock) in the right circumstances.

Also, it's never been okay to break things just because a patch
further down the line fixes it again (or breaks it in a different
way). Please explain your changes; this also serves to document that
you haven't accidentally missed a case.

Thanks,
Andreas

