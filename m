Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 316B8391FA7
	for <lists+cluster-devel@lfdr.de>; Wed, 26 May 2021 20:50:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1622055056;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=r8U8l4dAq7fCVZLWXnTICF3fjtWAoL6xPRh5BeEIsGo=;
	b=iitqx+nl8vIqiSjF7ZhZvjbDFinJkdjlL2tmG4whqg5mNeNvti1+xO+A/BBixzaLhJcDO0
	W8VVnsPIGCgNrZ6rKqcwI4VfvBds+jFstA5i8uvd/hD/927lZuTGRvQvpUUbr6OGLeOdEN
	cpbrFUgFAfHdCHuxOR/FHc09f5GVzx0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-331-AzNOeC1vM0qYE-mTevzAhA-1; Wed, 26 May 2021 14:50:51 -0400
X-MC-Unique: AzNOeC1vM0qYE-mTevzAhA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3BABD8042AE;
	Wed, 26 May 2021 18:50:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2640C61F5E;
	Wed, 26 May 2021 18:50:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AA7351800BB8;
	Wed, 26 May 2021 18:50:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14QIokGM029496 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 26 May 2021 14:50:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 81B1F209A7E5; Wed, 26 May 2021 18:50:46 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D556209A7E4
	for <cluster-devel@redhat.com>; Wed, 26 May 2021 18:50:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 49B8390DE22
	for <cluster-devel@redhat.com>; Wed, 26 May 2021 18:50:43 +0000 (UTC)
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
	[209.85.166.70]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-24-xvjrPgmTPmyCQqzioZLY0A-1; Wed, 26 May 2021 14:50:41 -0400
X-MC-Unique: xvjrPgmTPmyCQqzioZLY0A-1
Received: by mail-io1-f70.google.com with SMTP id
	e18-20020a5ed5120000b029041705a6ed5cso1433782iom.4
	for <cluster-devel@redhat.com>; Wed, 26 May 2021 11:50:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=r8U8l4dAq7fCVZLWXnTICF3fjtWAoL6xPRh5BeEIsGo=;
	b=AU/S4eZeBSSJQOqwbAMr2dmd46chHSdizpojJF8GBSsOkbEz+6Wug6n+0BDa79Gl/l
	Xwq+DyhIJqMnQyIruCDhWnTSIeEbpQLBEDl5i+C6B2n9Ssbf+fuCTmD9dXy0Dz/vI1CS
	mVjUCAl3pEB4EV82hoANJAKg+4E8ynhexmgxSSQkzvf96vm0vP/xpb2aAjXUtQIg4ShO
	cOR90cM+XEhnfTyDGzz5C4hvRMrk0BgF7pSTWqpl2CmzZA5+wSxXCAjFY2PHFkavC8LO
	AHN8P4WQ5nDSb0O6BqvnuGGuERVVf1YjwCbfjGjMzmAoyY7uCKW0V7XxwRLX73ciJTYr
	SvMQ==
X-Gm-Message-State: AOAM532zFOlpHHXvT6u+00D2h4tOhCOAQ5Qsi7SOfdUzchufcf3yv/N7
	69IHAsUG8eGSdYNEaH1F6cw4F/3pOFHJd+j2yFDqagslZFRVUBUX3i6HGN26THKWa2/vy5q2q6L
	9Pe5g1mGZ3ANxbcdWJhFeVU7hJNUj/7AHrBQ1Mw==
X-Received: by 2002:a05:6e02:1d0b:: with SMTP id
	i11mr24946563ila.36.1622055040507; 
	Wed, 26 May 2021 11:50:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxWdlVDqsrj0ZiVQfex/txYF3LhvArUsKLowNWV1GDQ0d8wQTy5HNq7BAr2OOhHvfOXOCPKSvDLYFtZMpnAVLk=
X-Received: by 2002:a05:6e02:1d0b:: with SMTP id
	i11mr24946549ila.36.1622055040300; 
	Wed, 26 May 2021 11:50:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210526134039.3448305-1-colin.king@canonical.com>
	<20210526150133.GQ1955@kadam>
	<c5ea0085-969a-339f-fd92-6724cb1d928e@canonical.com>
	<20210526181726.GJ24442@kadam>
In-Reply-To: <20210526181726.GJ24442@kadam>
From: Alexander Ahring Oder Aring <aahringo@redhat.com>
Date: Wed, 26 May 2021 14:50:29 -0400
Message-ID: <CAK-6q+jEfu_bHYgHZJTase3fe9Y_mYmkKzfjEPjZw5g_PRRz8Q@mail.gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
	cluster-devel@redhat.com, Colin Ian King <colin.king@canonical.com>
Subject: Re: [Cluster-devel] [PATCH][next] fs: dlm: Fix memory leak of
	object mh
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
Content-Type: text/plain; charset="UTF-8"

Hi,

On Wed, May 26, 2021 at 2:24 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Wed, May 26, 2021 at 04:11:06PM +0100, Colin Ian King wrote:
> > On 26/05/2021 16:01, Dan Carpenter wrote:
> > > On Wed, May 26, 2021 at 02:40:39PM +0100, Colin King wrote:
> > >> From: Colin Ian King <colin.king@canonical.com>
> > >>
> > >> There is an error return path that is not kfree'ing mh after
> > >> it has been successfully allocates.  Fix this by free'ing it.
> > >>
> > >> Addresses-Coverity: ("Resource leak")
> > >> Fixes: a070a91cf140 ("fs: dlm: add more midcomms hooks")
> > >> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > >> ---
> > >>  fs/dlm/rcom.c | 1 +
> > >>  1 file changed, 1 insertion(+)
> > >>
> > >> diff --git a/fs/dlm/rcom.c b/fs/dlm/rcom.c
> > >> index 085f21966c72..19298edc1573 100644
> > >> --- a/fs/dlm/rcom.c
> > >> +++ b/fs/dlm/rcom.c
> > >> @@ -393,6 +393,7 @@ static void receive_rcom_lookup(struct dlm_ls *ls, struct dlm_rcom *rc_in)
> > >>    if (rc_in->rc_id == 0xFFFFFFFF) {
> > >>            log_error(ls, "receive_rcom_lookup dump from %d", nodeid);
> > >>            dlm_dump_rsb_name(ls, rc_in->rc_buf, len);
> > >> +          kfree(mh);
> > >
> > > Am I looking at the same code as you?  (I often am not able to review
> > > your patches because you're doing development on stuff that hasn't hit
> > > linux-next).  Anyway, to me this doesn't seem like the correct fix at
> > > all.  There are some other things to free and the "mh" pointer is on
> > > a bunch of lists so it leads to use after frees.
>       ^^^^^^^^^^^^^^
> This is sort of impossible, of course, because the struct only has one
> list_head so it can only be in one list and not a "bunch of lists".
>

It is a bunch of lists because mh_handle holds pointers with ref
counters to other structures which are part of lists. :) There is a
list_del() only if hits zero.

> The dlm code seems to be going out of its way to use void pointers and
> that makes it difficult to parse with Smatch.
>

That has been changed on dlm/next. There exists a struct mh_handle *
and a dlm_msg * to get rid of void * handles.

> But in other subsystems, we could make it a rule that list_heads are
> "poison" "init" or "added".  If you freed a memory with an "added"
> list_head then print a warning.  Or if you added a list_head but it was
> already in the added state then print a warning.  Another idea is that
> if you freed a struct mh before the mh->page allocation was freed then
> print a warning about the leak.  This one is probably more prone to
> false positives but there might be workarounds for those.  #IdeasToImplement
>

Currently if a buffer is allocated it is not possible to free it
again. The allocated buffer of the page will be transmitted
(kernel_sendpage()) out in a contiguous way. If somebody wants to
release memory the page buffer needs to be reordered and it can only
be done before commit().

- Alex

