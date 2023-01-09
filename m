Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F422662F6D
	for <lists+cluster-devel@lfdr.de>; Mon,  9 Jan 2023 19:45:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673289950;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=OBdxaz+hVkdsSEH2VxeqeTgj+6Xw+8m/8DNP4CLwX2k=;
	b=geFly5nPGfNKpb7QA0XFKoFW9e4UbKZJMrv2UEiIrUYJZWMVu8TIG1KEPaHMedwI+Z9NKY
	HLQjeS512afwYnYSYqP5f9pfoQoulbAHqqjDGvzlc6X5hhR2jP56TkgeBZRBUt7d0buoJb
	9VtGHdfvmcYSRRGXRPyC2brM2ZmEJEY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-584-gO7dmYQWNtyydGELM-37FQ-1; Mon, 09 Jan 2023 13:45:48 -0500
X-MC-Unique: gO7dmYQWNtyydGELM-37FQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7A963185A794;
	Mon,  9 Jan 2023 18:45:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A36E1175AD;
	Mon,  9 Jan 2023 18:45:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5AC2F1949756;
	Mon,  9 Jan 2023 18:45:43 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4916A1946587 for <cluster-devel@listman.corp.redhat.com>;
 Mon,  9 Jan 2023 18:45:42 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id EB9EB42220; Mon,  9 Jan 2023 18:45:41 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E3C35175AD
 for <cluster-devel@redhat.com>; Mon,  9 Jan 2023 18:45:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C4C1F3811F29
 for <cluster-devel@redhat.com>; Mon,  9 Jan 2023 18:45:41 +0000 (UTC)
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-232-cGeJ7A7wOj6RlV_DkTahvw-1; Mon, 09 Jan 2023 13:45:40 -0500
X-MC-Unique: cGeJ7A7wOj6RlV_DkTahvw-1
Received: by mail-pg1-f197.google.com with SMTP id
 r126-20020a632b84000000b004393806c06eso4024901pgr.4
 for <cluster-devel@redhat.com>; Mon, 09 Jan 2023 10:45:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OBdxaz+hVkdsSEH2VxeqeTgj+6Xw+8m/8DNP4CLwX2k=;
 b=5zJP7WdcmUPMcGp1ibJ4/YVo84gRNBCnpu45Dx5wx+Igu/7+1jJG6rMCerUTWHnh23
 mFflOkNN8E6OgpL50fmWoWOA5U47cPSnb4VB5Hs+SwgslbqXVSNQlrZuw2JLtYFqfiFQ
 N9rtnCWDkq8jN1Sa4ExwOHB+poupknGlTuF+I4jVVHhLgxZBaTnajufRz6nGPmnJAGBy
 PLrt2i/T3O6/HmWILpTqe6fS7ovtaVBhZIhzGy4jjIsrFXzmzWdQkfUlCjAG5iBDKybI
 G3Uey74tZeRofgvOkPBZIiwwVrMxK8BKA4CaYnEZA1XrlHFxb/BVKRrRLn2wTW/M2lb/
 6sEA==
X-Gm-Message-State: AFqh2koluGwsYcg7CdS07acCS1bW1N2igcs5zkYetKjnkd/OJ8uWNeX9
 ddqQflDwhpk6pOXViEojIS04eFP8dTOB7i1kWPp4864Tvp3POEFoh2tvs3Ik8gyk1aIFs4NeIzG
 djNely/MzK7+sWLGW/wIaDgsSUQqNAiwztaQVDA==
X-Received: by 2002:a65:68c7:0:b0:4a2:d7ef:742a with SMTP id
 k7-20020a6568c7000000b004a2d7ef742amr1949087pgt.536.1673289939458; 
 Mon, 09 Jan 2023 10:45:39 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvWzDB61RFPkGZMxNhIFbmnTWsXzRwrl/mBojgRuoVDxrVvPOFKyxdjaDVl5vKiHvxHqafKv7FMRJIzVJSlsoQ=
X-Received: by 2002:a65:68c7:0:b0:4a2:d7ef:742a with SMTP id
 k7-20020a6568c7000000b004a2d7ef742amr1949084pgt.536.1673289939171; Mon, 09
 Jan 2023 10:45:39 -0800 (PST)
MIME-Version: 1.0
References: <20230108194034.1444764-1-agruenba@redhat.com>
 <20230108194034.1444764-9-agruenba@redhat.com>
 <20230108215911.GP1971568@dread.disaster.area>
In-Reply-To: <20230108215911.GP1971568@dread.disaster.area>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Mon, 9 Jan 2023 19:45:27 +0100
Message-ID: <CAHc6FU4z1nC8zdM8NvUyMqU29_J7_oNu1pvBHuOvR+M6gq7F0Q@mail.gmail.com>
To: Dave Chinner <david@fromorbit.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: Re: [Cluster-devel] [RFC v6 08/10] iomap/xfs: Eliminate the
 iomap_valid handler
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
Cc: linux-xfs@vger.kernel.org, cluster-devel@redhat.com,
 "Darrick J . Wong" <djwong@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Sun, Jan 8, 2023 at 10:59 PM Dave Chinner <david@fromorbit.com> wrote:
> On Sun, Jan 08, 2023 at 08:40:32PM +0100, Andreas Gruenbacher wrote:
> > Eliminate the ->iomap_valid() handler by switching to a ->get_folio()
> > handler and validating the mapping there.
> >
> > Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
>
> I think this is wrong.
>
> The ->iomap_valid() function handles a fundamental architectural
> issue with cached iomaps: the iomap can become stale at any time
> whilst it is in use by the iomap core code.
>
> The current problem it solves in the iomap_write_begin() path has to
> do with writeback and memory reclaim races over unwritten extents,
> but the general case is that we must be able to check the iomap
> at any point in time to assess it's validity.
>
> Indeed, we also have this same "iomap valid check" functionality in the
> writeback code as cached iomaps can become stale due to racing
> writeback, truncated, etc. But you wouldn't know it by looking at the iomap
> writeback code - this is currently hidden by XFS by embedding
> the checks into the iomap writeback ->map_blocks function.
>
> That is, the first thing that xfs_map_blocks() does is check if the
> cached iomap is valid, and if it is valid it returns immediately and
> the iomap writeback code uses it without question.
>
> The reason that this is embedded like this is that the iomap did not
> have a validity cookie field in it, and so the validity information
> was wrapped around the outside of the iomap_writepage_ctx and the
> filesystem has to decode it from that private wrapping structure.
>
> However, the validity information iin the structure wrapper is
> indentical to the iomap validity cookie,

Then could that part of the xfs code be converted to use
iomap->validity_cookie so that struct iomap_writepage_ctx can be
eliminated?

> and so the direction I've
> been working towards is to replace this implicit, hidden cached
> iomap validity check with an explicit ->iomap_valid call and then
> only call ->map_blocks if the validity check fails (or is not
> implemented).
>
> I want to use the same code for all the iomap validity checks in all
> the iomap core code - this is an iomap issue, the conditions where
> we need to check for iomap validity are different for depending on
> the iomap context being run, and the checks are not necessarily
> dependent on first having locked a folio.
>
> Yes, the validity cookie needs to be decoded by the filesystem, but
> that does not dictate where the validity checking needs to be done
> by the iomap core.
>
> Hence I think removing ->iomap_valid is a big step backwards for the
> iomap core code - the iomap core needs to be able to formally verify
> the iomap is valid at any point in time, not just at the point in
> time a folio in the page cache has been locked...

We don't need to validate an iomap "at any time". It's two specific
places in the code in which we need to check, and we're not going to
end up with ten more such places tomorrow. I'd prefer to keep those
filesystem internals in the filesystem specific code instead of
exposing them to the iomap layer. But that's just me ...

If we ignore this particular commit for now, do you have any
objections to the patches in this series? If not, it would be great if
we could add the other patches to iomap-for-next.

By the way, I'm still not sure if gfs2 is affected by this whole iomap
validation drama given that it neither implements unwritten extents
nor delayed allocation. This is a mess.

Thanks,
Andreas

