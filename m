Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2048D6554D7
	for <lists+cluster-devel@lfdr.de>; Fri, 23 Dec 2022 23:05:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671833123;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=XOJ5z7kFjWc68B5B6Sh1NWt9teGCI8E34Z2/SZr41S8=;
	b=dyVzW4r2G5z1vcDYxryiHzIOKvwFxKsL3ZrytvDBb5yR5POtsYCx6KlVjs+3RuE0DuylVy
	5e9VgffB8tgkJd2aJ8TREhTUSOpNzzD8bjrbnvDX4KlYSmd6LY33DDO+ekb5ufEzlyUkcu
	032SG/qaRiPUsh72L2jpqR5nNHyOF2c=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-277-Bj8p-7ZEM6elPw-8VGqvng-1; Fri, 23 Dec 2022 17:05:12 -0500
X-MC-Unique: Bj8p-7ZEM6elPw-8VGqvng-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DF88F2999B3E;
	Fri, 23 Dec 2022 22:05:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9EF44C15BA0;
	Fri, 23 Dec 2022 22:05:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4FD9419465B6;
	Fri, 23 Dec 2022 22:05:10 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4C2F719465B1 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 23 Dec 2022 22:05:08 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2C70C492C18; Fri, 23 Dec 2022 22:05:08 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 24B96492C14
 for <cluster-devel@redhat.com>; Fri, 23 Dec 2022 22:05:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 09241858F09
 for <cluster-devel@redhat.com>; Fri, 23 Dec 2022 22:05:08 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-424-opKQBkVVPsOLQsBhsYyIbw-1; Fri, 23 Dec 2022 17:05:04 -0500
X-MC-Unique: opKQBkVVPsOLQsBhsYyIbw-1
Received: by mail-qt1-f174.google.com with SMTP id h21so4652968qta.12;
 Fri, 23 Dec 2022 14:05:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XOJ5z7kFjWc68B5B6Sh1NWt9teGCI8E34Z2/SZr41S8=;
 b=3SRCyoWrxWfEoESkhwqnWTmSZaIJfIs3jQKeUeMAw8fs3VMjMF6rO2P6DFPRPuS4JI
 GTlrtFFt8wWhcHyxuh3MHMPaJgQ1/dNvxbepMYGf9JEkF2kDPs/hc7msmWP4+xHJrJK/
 0+zEmzBoUmorD2fQJ45FwnX7G1txIiMHmNtxsj9vzgx8/QKxkGtq8BkUdXe77fFcMSY9
 1/4DBFISZWScyFUZugkw80EZnt01gSNKXV+u/ffuCZ4sRW1bjSQA2xkpGQG2DTlUJHQd
 BHLRa5k6hA/ypaaNMK165f5eojNitm2DGTxK/TU4AFkyI6t+kpwkGVvz/0DBWQEvLbSM
 IQPA==
X-Gm-Message-State: AFqh2ko/S3DWWBnTSMwwDQWxIbTQqORjyBMc7xnO/DnSkCX7Z+CWePdk
 p5DOhMW3mZ7kiY9iO/ofptH1d19FiQVr5UfAigI=
X-Google-Smtp-Source: AMrXdXuipY+SQ8jSfCWfT/V64MUdmK6UvoWduFpm5A8Hx7l02aMdqZw2KCqhbqXafoBpp8zEGiBHF8fUV8HiMG2klj4=
X-Received: by 2002:a05:622a:244c:b0:3a8:12f6:69ff with SMTP id
 bl12-20020a05622a244c00b003a812f669ffmr451928qtb.567.1671833103695; Fri, 23
 Dec 2022 14:05:03 -0800 (PST)
MIME-Version: 1.0
References: <20221216150626.670312-1-agruenba@redhat.com>
 <20221216150626.670312-2-agruenba@redhat.com>
 <Y6XBi/YJ4QV3NK5q@infradead.org>
In-Reply-To: <Y6XBi/YJ4QV3NK5q@infradead.org>
From: =?UTF-8?Q?Andreas_Gr=C3=BCnbacher?= <andreas.gruenbacher@gmail.com>
Date: Fri, 23 Dec 2022 23:04:51 +0100
Message-ID: <CAHpGcMKJO7HhgyU5NKX3h6vVeNAGp-8xFrOf+nSTEWHC-PekzA@mail.gmail.com>
To: Christoph Hellwig <hch@infradead.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: Re: [Cluster-devel] [RFC v3 1/7] fs: Add folio_may_straddle_isize
 helper
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
Cc: cluster-devel@redhat.com, "Darrick J . Wong" <djwong@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, linux-xfs@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Am Fr., 23. Dez. 2022 um 16:06 Uhr schrieb Christoph Hellwig
<hch@infradead.org>:
> On Fri, Dec 16, 2022 at 04:06:20PM +0100, Andreas Gruenbacher wrote:
> > Add a folio_may_straddle_isize() helper as a replacement for
> > pagecache_isize_extended() when we have a locked folio.
>
> I find the naming very confusing.  Any good reason to not follow
> the naming of pagecache_isize_extended an call it
> folio_isize_extended?

A good reason for a different name is because
folio_may_straddle_isize() requires a locked folio, while
pagecache_isize_extended() will fail if the folio is still locked. So
this doesn't follow the usual "replace 'page' with 'folio'" pattern.

> > Use the new helper in generic_write_end(), iomap_write_end(),
> > ext4_write_end(), and ext4_journalled_write_end().
>
> Please split this into a patch per caller in addition to the one
> adding the helper, and write commit logs explaining the rationale
> for the helper.  The obious ones I'm trying to guess are that
> the new helper avoid a page cache radix tree lookup and a lock
> page/folio cycle, but I'd rather hear that from the horses mouth
> in the commit log.

Yes, that's what the horse says.

> > --- a/fs/buffer.c
> > +++ b/fs/buffer.c
> > @@ -2164,16 +2164,15 @@ int generic_write_end(struct file *file, struct address_space *mapping,
> >        * But it's important to update i_size while still holding page lock:
> >        * page writeout could otherwise come in and zero beyond i_size.
> >        */
> > -     if (pos + copied > inode->i_size) {
> > +     if (pos + copied > old_size) {
>
> This is and unrelated and undocument (but useful) change.  Please split
> it out as well.
>
> > + * This function must be called while we still hold i_rwsem - this not only
> > + * makes sure i_size is stable but also that userspace cannot observe the new
> > + * i_size value before we are prepared to handle mmap writes there.
>
> Please add a lockdep_assert_held_write to enforce that.
>
> > +void folio_may_straddle_isize(struct inode *inode, struct folio *folio,
> > +                           loff_t old_size, loff_t start)
> > +{
> > +     unsigned int blocksize = i_blocksize(inode);
> > +
> > +     if (round_up(old_size, blocksize) >= round_down(start, blocksize))
> > +             return;
> > +
> > +     /*
> > +      * See clear_page_dirty_for_io() for details why folio_set_dirty()
> > +      * is needed.
> > +      */
> > +     if (folio_mkclean(folio))
> > +             folio_set_dirty(folio);
>
> Should pagecache_isize_extended be rewritten to use this helper,
> i.e. turn this into a factoring out of a helper?

I'm not really sure about that. The boundary conditions in the two
functions are not identical. I think the logic in
folio_may_straddle_isize() is sufficient for the
extending-write-under-folio-lock case, but I'd still need confirmation
for that. If the same logic would also be enough in
pagecache_isize_extended() is more unclear to me.

> > +EXPORT_SYMBOL(folio_may_straddle_isize);
>
> Please make this an EXPORT_SYMBOL_GPL just like folio_mkclean.

Thanks,
Andreas

