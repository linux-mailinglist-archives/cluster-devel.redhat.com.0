Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C516728D2
	for <lists+cluster-devel@lfdr.de>; Wed, 18 Jan 2023 20:57:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674071863;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=jE7UUdy8PLtXYkvU/lzVvfasVo94/Kknt5WCrMd4jf8=;
	b=PWEKRGI133khxIAi7hUuAJJi7Am/DBQ1cYOio0XGE8zOq+JybeI7Pm4UZsr/7mQLgP3lOI
	EZseGDppLq4QbXPU3VtLWb0pa/OA15i0nofzjmMUyG5RmAeWO1q41P0izFaCsTc6flwDU9
	OY+r7qZKyM5l6rbeVcwE0Je08Bz7d40=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-448-v5euegLrOk2dvwv9aSQENQ-1; Wed, 18 Jan 2023 14:57:39 -0500
X-MC-Unique: v5euegLrOk2dvwv9aSQENQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 21F548533DA;
	Wed, 18 Jan 2023 19:57:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BEE2E140EBF6;
	Wed, 18 Jan 2023 19:57:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8C0181946A6E;
	Wed, 18 Jan 2023 19:57:38 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id EBFA31946A45 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 18 Jan 2023 19:57:37 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id CE580140EBF6; Wed, 18 Jan 2023 19:57:37 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C583E140EBF5
 for <cluster-devel@redhat.com>; Wed, 18 Jan 2023 19:57:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A9DEF101A521
 for <cluster-devel@redhat.com>; Wed, 18 Jan 2023 19:57:37 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com
 [209.85.219.54]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-588-XXvrzmPmNjqo4cxAwCriJg-1; Wed, 18 Jan 2023 14:57:36 -0500
X-MC-Unique: XXvrzmPmNjqo4cxAwCriJg-1
Received: by mail-qv1-f54.google.com with SMTP id l14so20704064qvw.12;
 Wed, 18 Jan 2023 11:57:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jE7UUdy8PLtXYkvU/lzVvfasVo94/Kknt5WCrMd4jf8=;
 b=d3krAYsjTUfXXJc/YGyjbVp/oTp4AQAHQ044nwfUQwdVuJICIQIIbHc+XKzMdsztMW
 1WJ7uARiCmmaWByU17MKWd7p+KgWlz601pU1BN94LVOqrEW+kPUdsXqE3TjI/shWMvHt
 gjPwhXUCejehNpsepMVdLAtFHJMM0AgsATMUh6ovS/usj25iQGq5P8YtiVlv+VxoWjJM
 b+5y/4y1ilBk7wnWuIL2wMHrXWDqsffneICKJtzA/tR3ZZ5fY4/8CeeZ6BMCUisLlpTA
 MoFGoLPoNcKA1e5NjuhA4OoQwH9FAemkDlRfR7Z13/WdKTbYXtt5RWIu8d/pX8iZCqwA
 zo4g==
X-Gm-Message-State: AFqh2koeE5fFYrNZwp1skC+CqSgb7FK4YMI7CBM5WKoJXJHEtuIAgY0+
 OZo7VJRfrGr6KHYktBGQRLIhIAuhvx5Qh9+5Thc=
X-Google-Smtp-Source: AMrXdXve2EgHGv+2cv1pHkrPy3geUJuLfVqUa2trthVWJaRmjDPV20b7EKg3SSIV8PR21z7dow6K6rvn9Y0mMDKfOqc=
X-Received: by 2002:a05:6214:5e05:b0:534:b3ca:8638 with SMTP id
 li5-20020a0562145e0500b00534b3ca8638mr437696qvb.19.1674071855381; Wed, 18 Jan
 2023 11:57:35 -0800 (PST)
MIME-Version: 1.0
References: <20230108194034.1444764-1-agruenba@redhat.com>
 <20230108194034.1444764-9-agruenba@redhat.com>
 <20230108215911.GP1971568@dread.disaster.area>
 <CAHc6FU4z1nC8zdM8NvUyMqU29_J7_oNu1pvBHuOvR+M6gq7F0Q@mail.gmail.com>
 <20230109225453.GQ1971568@dread.disaster.area>
 <CAHpGcM+urV5LYpTZQWTRoK6VWaLx0sxk3mDe_kd3VznMY9woVw@mail.gmail.com>
 <Y8Q4FmhYehpQPZ3Z@magnolia> <Y8eeAmm1Vutq3Fc9@infradead.org>
 <Y8hCq+fIWgHfUufe@magnolia>
In-Reply-To: <Y8hCq+fIWgHfUufe@magnolia>
From: =?UTF-8?Q?Andreas_Gr=C3=BCnbacher?= <andreas.gruenbacher@gmail.com>
Date: Wed, 18 Jan 2023 20:57:24 +0100
Message-ID: <CAHpGcMJmi6gncj=a0NZrbm11AJoN5u0-F7GUnwFZRVbCL=Dpqw@mail.gmail.com>
To: "Darrick J. Wong" <djwong@kernel.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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
Cc: linux-xfs@vger.kernel.org, Damien Le Moal <damien.lemoal@wdc.com>,
 cluster-devel@redhat.com, Dave Chinner <david@fromorbit.com>,
 Matthew Wilcox <willy@infradead.org>, Alexander Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Am Mi., 18. Jan. 2023 um 20:04 Uhr schrieb Darrick J. Wong <djwong@kernel.org>:
>
> On Tue, Jan 17, 2023 at 11:21:38PM -0800, Christoph Hellwig wrote:
> > On Sun, Jan 15, 2023 at 09:29:58AM -0800, Darrick J. Wong wrote:
> > > I don't have any objections to pulling everything except patches 8 and
> > > 10 for testing this week.
> >
> > That would be great.  I now have a series to return the ERR_PTR
> > from __filemap_get_folio which will cause a minor conflict, but
> > I think that's easy enough for Linux to handle.
>
> Ok, done.
>
> > >
> > > 1. Does zonefs need to revalidate mappings?  The mappings are 1:1 so I
> > > don't think it does, but OTOH zone pointer management might complicate
> > > that.
> >
> > Adding Damien.
> >
> > > 2. How about porting the writeback iomap validation to use this
> > > mechanism?  (I suspect Dave might already be working on this...)
> >
> > What is "this mechanism"?  Do you mean the here removed ->iomap_valid
> > ?   writeback calls into ->map_blocks for every block while under the
> > folio lock, so the validation can (and for XFS currently is) done
> > in that.  Moving it out into a separate method with extra indirect
> > functiona call overhead and interactions between the methods seems
> > like a retrograde step to me.
>
> Sorry, I should've been more specific -- can xfs writeback use the
> validity cookie in struct iomap and thereby get rid of struct
> xfs_writepage_ctx entirely?

Already asked and answered in the same thread:

https://lore.kernel.org/linux-fsdevel/20230109225453.GQ1971568@dread.disaster.area/

> > > 2. Do we need to revalidate mappings for directio writes?  I think the
> > > answer is no (for xfs) because the ->iomap_begin call will allocate
> > > whatever blocks are needed and truncate/punch/reflink block on the
> > > iolock while the directio writes are pending, so you'll never end up
> > > with a stale mapping.
> >
> > Yes.
>
> Er... yes as in "Yes, we *do* need to revalidate directio writes", or
> "Yes, your reasoning is correct"?
>
> --D

