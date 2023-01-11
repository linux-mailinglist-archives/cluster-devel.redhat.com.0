Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 07DE5666517
	for <lists+cluster-devel@lfdr.de>; Wed, 11 Jan 2023 21:53:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673470380;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=EkqhoeCZuwa+2bEMUhxCOdyrJETsu5EtKMG81jKmyM4=;
	b=N0wPAh2C6s3pYvWpLz2o18OosIeENEShKoF6rWnlvsp7cmducjPFYUreVBfQpvdMW31skb
	RkdqZukKgkH8mELRqmePSGHgXCNYORH/CFanc8v85JaQdzg+mMjkmhHuVIaHOnuOm7guT2
	vYu6m2w7WKMbswQQdCXUJ1F9WwJRFPs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-563-wBJN1Sj4Nv2wVWPwaLkBwA-1; Wed, 11 Jan 2023 15:52:54 -0500
X-MC-Unique: wBJN1Sj4Nv2wVWPwaLkBwA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BEBA48030D5;
	Wed, 11 Jan 2023 20:52:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3AA6B492C18;
	Wed, 11 Jan 2023 20:52:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E7D031946A45;
	Wed, 11 Jan 2023 20:52:51 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A6CAB19465A3 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 11 Jan 2023 20:52:49 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 02E071121318; Wed, 11 Jan 2023 20:52:49 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EE90C1121314
 for <cluster-devel@redhat.com>; Wed, 11 Jan 2023 20:52:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CA6E03806704
 for <cluster-devel@redhat.com>; Wed, 11 Jan 2023 20:52:48 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-13-QP2M_D8bMG6p3RuXgdK7Lw-1; Wed, 11 Jan 2023 15:52:46 -0500
X-MC-Unique: QP2M_D8bMG6p3RuXgdK7Lw-1
Received: by mail-pj1-f49.google.com with SMTP id n12so17076515pjp.1
 for <cluster-devel@redhat.com>; Wed, 11 Jan 2023 12:52:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EkqhoeCZuwa+2bEMUhxCOdyrJETsu5EtKMG81jKmyM4=;
 b=63fxBXu6PhCS+VtCEjcbutY870khwMlSw8lGnk8yYSqkM8SSFcYb114U0LGx87LP0f
 vK4MPK+A/Q1S1jcKqr/fpsVhEfKAGUCbaaIYra2ueEJNeuhGit/V5WfROg2u4w7MAZw4
 q49rXMWDZ5M1+gneSMSmpSkzkigjhQiLp8CZjH3hYyXPOn270gurT/fR9K1Wnqa1Jc54
 X7orTAyRpnUW7ioBaswRJjO98VyJTwtJ9+So8KeQiKrSsb5/3wZSYbTPOPXc2HtATxip
 /Bp1ZJn+jL9eJTZQPEr6sa+yp1XDoEKTxSFjz2X7Lf2t5WrQCWRFb/m+sTW1g3shvw1o
 2nOg==
X-Gm-Message-State: AFqh2kqPsw9XKhQ9HtFhVqJJw6DTkNEgtEJq6yjzbYfRixy4XOp70NqG
 o2GaltNYcv7DKdDBudq84oWLan8QoD29jNJO
X-Google-Smtp-Source: AMrXdXvgN3R619MlFxvZvgNlbNpdfvMY7I+Ko6fk0fK9VdXQkV2T920mtD/TBJG8wFVTjldQGALEWg==
X-Received: by 2002:a17:902:ce02:b0:18f:a5b6:54f9 with SMTP id
 k2-20020a170902ce0200b0018fa5b654f9mr80454345plg.11.1673470365866; 
 Wed, 11 Jan 2023 12:52:45 -0800 (PST)
Received: from dread.disaster.area (pa49-186-146-207.pa.vic.optusnet.com.au.
 [49.186.146.207]) by smtp.gmail.com with ESMTPSA id
 t2-20020a1709027fc200b00192f9991e51sm10459441plb.251.2023.01.11.12.52.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jan 2023 12:52:45 -0800 (PST)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
 (envelope-from <david@fromorbit.com>)
 id 1pFi5R-001vGU-0W; Thu, 12 Jan 2023 07:52:41 +1100
Date: Thu, 12 Jan 2023 07:52:41 +1100
From: Dave Chinner <david@fromorbit.com>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20230111205241.GA360264@dread.disaster.area>
References: <20230108213305.GO1971568@dread.disaster.area>
 <20230108194034.1444764-1-agruenba@redhat.com>
 <20230108194034.1444764-5-agruenba@redhat.com>
 <20230109124642.1663842-1-agruenba@redhat.com>
 <Y70l9ZZXpERjPqFT@infradead.org>
 <Y71pWJ0JHwGrJ/iv@casper.infradead.org>
 <Y72DK9XuaJfN+ecj@infradead.org>
 <Y78PunroeYbv2qgH@casper.infradead.org>
MIME-Version: 1.0
In-Reply-To: <Y78PunroeYbv2qgH@casper.infradead.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: Re: [Cluster-devel] [RFC v6 04/10] iomap: Add iomap_get_folio helper
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
 "Darrick J . Wong" <djwong@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 11, 2023 at 07:36:26PM +0000, Matthew Wilcox wrote:
> On Tue, Jan 10, 2023 at 07:24:27AM -0800, Christoph Hellwig wrote:
> > On Tue, Jan 10, 2023 at 01:34:16PM +0000, Matthew Wilcox wrote:
> > > > Exactly.  And as I already pointed out in reply to Dave's original
> > > > patch what we really should be doing is returning an ERR_PTR from
> > > > __filemap_get_folio instead of reverse-engineering the expected
> > > > error code.
> > > 
> > > Ouch, we have a nasty problem.
> > > 
> > > If somebody passes FGP_ENTRY, we can return a shadow entry.  And the
> > > encodings for shadow entries overlap with the encodings for ERR_PTR,
> > > meaning that some shadow entries will look like errors.  The way I
> > > solved this in the XArray code is by shifting the error values by
> > > two bits and encoding errors as XA_ERROR(-ENOMEM) (for example).
> > > 
> > > I don't _object_ to introducing XA_ERROR() / xa_err() into the VFS,
> > > but so far we haven't, and I'd like to make that decision intentionally.
> > 
> > So what would be an alternative way to tell the callers why no folio
> > was found instead of trying to reverse engineer that?  Return an errno
> > and the folio by reference?  The would work, but the calling conventions
> > would be awful.
> 
> Agreed.  How about an xa_filemap_get_folio()?
> 
> (there are a number of things to fix here; haven't decided if XA_ERROR
> should return void *, or whether i should use a separate 'entry' and
> 'folio' until I know the entry is actually a folio ...)

That's awful. Exposing internal implementation details in the API
that is supposed to abstract away the internal implementation
details from users doesn't seem like a great idea to me.

Exactly what are we trying to fix here?  Do we really need to punch
a hole through the abstraction layers like this just to remove half
a dozen lines of -slow path- context specific error handling from a
single caller?

If there's half a dozen cases that need this sort of handling, then
maybe it's the right thing to do. But for a single calling context
that only needs to add a null return check in one specific case?
There's absolutely no need to make generic infrastructure violate
layering abstractions to handle that...

-Dave.

-- 
Dave Chinner
david@fromorbit.com

