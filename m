Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E4B67230E
	for <lists+cluster-devel@lfdr.de>; Wed, 18 Jan 2023 17:25:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674059102;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=H4gPDbXgRwcEu9eRFB58g+gXi6AVjus+QHhs3v57+Uw=;
	b=AfOgxLbaVYiM9xgi/V2jqbBhjZtyqZWQUfcH6k+5fPSqyNmF8l9RnQir1JF27bmMUY6osW
	KEHPVt6V7FxaVBjZEObhYRyRsMMQreMNsbGkY9rNVECJEaEmhy1Djz6ykLyvqn/5w5QVtT
	WDJUdmZPvy7DCHJEDt7X9BcvnIWrI90=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-114-frE8yMMZMhO5DrxIMZb-vg-1; Wed, 18 Jan 2023 11:24:51 -0500
X-MC-Unique: frE8yMMZMhO5DrxIMZb-vg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C531C2817229;
	Wed, 18 Jan 2023 16:24:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 752FE492B00;
	Wed, 18 Jan 2023 16:24:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4A0A51946A6E;
	Wed, 18 Jan 2023 16:24:50 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9FF421946A45 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 18 Jan 2023 16:24:48 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 745CD40C6EC4; Wed, 18 Jan 2023 16:24:48 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D08A401530E
 for <cluster-devel@redhat.com>; Wed, 18 Jan 2023 16:24:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5213B857F82
 for <cluster-devel@redhat.com>; Wed, 18 Jan 2023 16:24:48 +0000 (UTC)
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-542-eKpoyKiwOWmzC8BYHN-RDQ-1; Wed, 18 Jan 2023 11:24:47 -0500
X-MC-Unique: eKpoyKiwOWmzC8BYHN-RDQ-1
Received: by mail-pj1-f71.google.com with SMTP id
 a2-20020a17090acb8200b00225c0839b80so1455562pju.5
 for <cluster-devel@redhat.com>; Wed, 18 Jan 2023 08:24:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=H4gPDbXgRwcEu9eRFB58g+gXi6AVjus+QHhs3v57+Uw=;
 b=O4TjAQMfRb/AEP+Of1mbzhBiZWOEWG1SkcANa20ZxVOvrWUAcHBn9R7xaDVVEgywzm
 hjRtM6DuLRyOk6lhEnoV/qJrK3Ht61pFzCoWu3zZGVCrjfl9dhj9+xvNmSNEXhYbHnvR
 Xf3gwUF2nkTC8pFd2OjYlUU8cuvYYtDukeDaA9BbIrCWz/oF8AOb0Au6UK6YGxSYUXcx
 0QtUKn3ka1mDk49Dp6pZ3DggamUanRjsclpOXXfE8KoeZrwdj4WOciR0W3Uw7VxPbuYR
 jl5bEmxoQf+YScxZxQpflXRpmtdj/UhEixleB1013f1Aj6/VAdcFmPIryluwh2w+niGa
 wNeQ==
X-Gm-Message-State: AFqh2kqAbDP8nmuLR+Ho9GpPfhrrSHD4acRceJQrV+joON9JiVpZO/zv
 kcQAR9B02LsSpYDowKUIzQunkgYIcsOorUEFcNfwVWMZD5JD/xsq/d68Vq4HU+Uga5c4TlHJlfB
 AUSZvbNL/2A+DonItk841RpsCJZylo/KKaYmhew==
X-Received: by 2002:a63:5849:0:b0:478:eb77:b104 with SMTP id
 i9-20020a635849000000b00478eb77b104mr618322pgm.236.1674059084730; 
 Wed, 18 Jan 2023 08:24:44 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtvkaGNY8lVgDyNm0tuarLhfWyFgPfPp/0vXS/hCHoGVIWXwNRYT3XKDintDuiBfiXwyin720mSswN72fFwbPw=
X-Received: by 2002:a63:5849:0:b0:478:eb77:b104 with SMTP id
 i9-20020a635849000000b00478eb77b104mr618307pgm.236.1674059084379; Wed, 18 Jan
 2023 08:24:44 -0800 (PST)
MIME-Version: 1.0
References: <20230118094329.9553-1-hch@lst.de>
 <20230118094329.9553-8-hch@lst.de>
 <Y8gXodKIUneO+XQb@casper.infradead.org>
In-Reply-To: <Y8gXodKIUneO+XQb@casper.infradead.org>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Wed, 18 Jan 2023 17:24:32 +0100
Message-ID: <CAHc6FU7Exz2kr+x7jvK1mi5ENOVCOXruP7qKSdPsyhSwmfMhDA@mail.gmail.com>
To: Matthew Wilcox <willy@infradead.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: Re: [Cluster-devel] [PATCH 7/9] gfs2: handle a NULL folio in
 gfs2_jhead_process_page
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
Cc: cluster-devel@redhat.com, linux-nilfs@vger.kernel.org,
 Hugh Dickins <hughd@google.com>, linux-afs@lists.infradead.org,
 linux-xfs@vger.kernel.org, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-ext4@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

[Christoph's email ended up in my spam folder; I hope that was a
one-time-only occurrence.]

On Wed, Jan 18, 2023 at 5:00 PM Matthew Wilcox <willy@infradead.org> wrote:
> On Wed, Jan 18, 2023 at 10:43:27AM +0100, Christoph Hellwig wrote:
> > filemap_get_folio can return NULL, so exit early for that case.
>
> I'm not sure it can return NULL in this specific case.  As I understand
> this code, we're scanning the journal looking for the log head.  We've
> just submitted the bio to read this page.  I suppose memory pressure
> could theoretically push the page out, but if it does, we're doing the
> wrong thing by just returning here; we need to retry reading the page.
>
> Assuming we're not willing to do the work to add that case, I think I'd
> rather see the crash in folio_wait_locked() than get data corruption
> from failing to find the head of the log.
>
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > ---
> >  fs/gfs2/lops.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/fs/gfs2/lops.c b/fs/gfs2/lops.c
> > index 1902413d5d123e..51d4b610127cdb 100644
> > --- a/fs/gfs2/lops.c
> > +++ b/fs/gfs2/lops.c
> > @@ -472,6 +472,8 @@ static void gfs2_jhead_process_page(struct gfs2_jdesc *jd, unsigned long index,
> >       struct folio *folio;
> >
> >       folio = filemap_get_folio(jd->jd_inode->i_mapping, index);
> > +     if (!folio)
> > +             return;

We're actually still holding a reference to the folio from the
find_or_create_page() in gfs2_find_jhead() here, so we know that
memory pressure can't push the page out and filemap_get_folio() won't
return NULL.

> >
> >       folio_wait_locked(folio);
> >       if (folio_test_error(folio))
> > --
> > 2.39.0
> >
>

Thanks,
Andreas

