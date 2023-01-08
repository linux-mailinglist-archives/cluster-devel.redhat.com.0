Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E3566185A
	for <lists+cluster-devel@lfdr.de>; Sun,  8 Jan 2023 19:50:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673203826;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=9jQNIllhSt00CU4g1E2gZlTxdbv8nF9P6i3eiXT6SBw=;
	b=IB0q0M3SnsOpshR4I1/gtNmeUxM79H/gbzdZ+drYeQaiybkjZxX4OPV5ioQQSxt1H3cuUT
	ktkpE5pNdCjTZTAiKJP/87Le625QfAwzoHTMPkNE2Ty5iCUgzHTwYH4g39KX0Jhxp268AF
	7lqufs49f3pYmBKbIwgcvRO4Zr8MaPQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-450-sxSbrA0tMLiJM6H2JCY5AA-1; Sun, 08 Jan 2023 13:50:20 -0500
X-MC-Unique: sxSbrA0tMLiJM6H2JCY5AA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 49F038027F8;
	Sun,  8 Jan 2023 18:50:19 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3FF1F492B00;
	Sun,  8 Jan 2023 18:50:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D72B81947062;
	Sun,  8 Jan 2023 18:50:17 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DB1F01946586 for <cluster-devel@listman.corp.redhat.com>;
 Sun,  8 Jan 2023 18:50:16 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 945821121318; Sun,  8 Jan 2023 18:50:16 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8C2671121314
 for <cluster-devel@redhat.com>; Sun,  8 Jan 2023 18:50:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 693798027F8
 for <cluster-devel@redhat.com>; Sun,  8 Jan 2023 18:50:16 +0000 (UTC)
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-191-iqdev3-lNLer90L2viRhEw-1; Sun, 08 Jan 2023 13:50:14 -0500
X-MC-Unique: iqdev3-lNLer90L2viRhEw-1
Received: by mail-pj1-f72.google.com with SMTP id
 kk14-20020a17090b4a0e00b00226f5087f41so791849pjb.3
 for <cluster-devel@redhat.com>; Sun, 08 Jan 2023 10:50:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9jQNIllhSt00CU4g1E2gZlTxdbv8nF9P6i3eiXT6SBw=;
 b=r9wvIn1VHcapLhTES9BuX4wqZttDgNQ58XLC/yPbzWI31E5F41RDa0YGR01CIfGxWw
 ldP8JHOnmzch2rXGPy4Doi7icTjWdwLQy74X2V74LCN8iBESw9HbIg6KOdqexMrLlV6K
 x6xsgdlY7dx8j9riNQcCt06G1U2WLObNoa5u1JlMYw7i9fsWScdayjUhIWtQYUUNjDq9
 biHphK0j0kIY6tnkM7F9x/+HtBUyR6k5c0lbe2VccKHMbkmS64Wrv72YX24fcz7iFhRj
 GBrn8BvYCD84kS6NU2XCBcigwN1dvr27H1m16xtDDlk5f3frO+vJjzTbuBpvUek7mYLC
 QchQ==
X-Gm-Message-State: AFqh2kqIXVeia11rkcWIuiFkQc1OgOdV5MOUL6GF1jWjJ7o3Oqb5eLcb
 GIaiHwTY4vd8cVPQ3gF5UEDvPT9+cPqY1hzspPWhpOchDZJLvxrJnkzHgdupjJ7v3s64KCKYNRO
 D4RoxxDOCcU7l2sfpw9jA7iIA8mC9VjrvSJvQkQ==
X-Received: by 2002:a17:902:e548:b0:18f:8f1e:992f with SMTP id
 n8-20020a170902e54800b0018f8f1e992fmr4306617plf.64.1673203813796; 
 Sun, 08 Jan 2023 10:50:13 -0800 (PST)
X-Google-Smtp-Source: AMrXdXstvvxTztVEE9wBUChZcquZg0V0o2leHuc2i1QtYb1NeSt2hpOsgP2alVmFjwEvRquoy8ThwzDAX538fmXv+p0=
X-Received: by 2002:a17:902:e548:b0:18f:8f1e:992f with SMTP id
 n8-20020a170902e54800b0018f8f1e992fmr4306613plf.64.1673203813573; Sun, 08 Jan
 2023 10:50:13 -0800 (PST)
MIME-Version: 1.0
References: <20221231150919.659533-1-agruenba@redhat.com>
 <20221231150919.659533-8-agruenba@redhat.com>
 <Y7W9Dfub1WeTvG8G@magnolia> <Y7XOoZNxZCpjCJLH@casper.infradead.org>
 <Y7r+NkbfDqat9uHA@infradead.org>
In-Reply-To: <Y7r+NkbfDqat9uHA@infradead.org>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Sun, 8 Jan 2023 19:50:01 +0100
Message-ID: <CAHc6FU40OYCpRjnitmKn6s9LOZCy4O=4XobHdcUeFc=k=x5cGg@mail.gmail.com>
To: Christoph Hellwig <hch@infradead.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: Re: [Cluster-devel] [PATCH v5 7/9] iomap/xfs: Eliminate the
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
Cc: cluster-devel@redhat.com, "Darrick J. Wong" <djwong@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, linux-xfs@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Sun, Jan 8, 2023 at 6:32 PM Christoph Hellwig <hch@infradead.org> wrote:
> On Wed, Jan 04, 2023 at 07:08:17PM +0000, Matthew Wilcox wrote:
> > On Wed, Jan 04, 2023 at 09:53:17AM -0800, Darrick J. Wong wrote:
> > > I wonder if this should be reworked a bit to reduce indenting:
> > >
> > >     if (PTR_ERR(folio) == -ESTALE) {
> >
> > FYI this is a bad habit to be in.  The compiler can optimise
> >
> >       if (folio == ERR_PTR(-ESTALE))
> >
> > better than it can optimise the other way around.
>
> Yes.  I think doing the recording that Darrick suggested combined
> with this style would be best:
>
>         if (folio == ERR_PTR(-ESTALE)) {
>                 iter->iomap.flags |= IOMAP_F_STALE;
>                 return 0;
>         }
>         if (IS_ERR(folio))
>                 return PTR_ERR(folio);

Again, I've implemented this as a nested if because the -ESTALE case
should be pretty rare, and if we unnest, we end up with an additional
check on the main code path. To be specific, the "before" code here on
my current system is this:

------------------------------------
        if (IS_ERR(folio)) {
    22ad:       48 81 fd 00 f0 ff ff    cmp    $0xfffffffffffff000,%rbp
    22b4:       0f 87 bf 03 00 00       ja     2679 <iomap_write_begin+0x499>
                        return 0;
                }
                return PTR_ERR(folio);
        }
[...]
    2679:       89 e8                   mov    %ebp,%eax
                if (folio == ERR_PTR(-ESTALE)) {
    267b:       48 83 fd 8c             cmp    $0xffffffffffffff8c,%rbp
    267f:       0f 85 b7 fc ff ff       jne    233c <iomap_write_begin+0x15c>
                        iter->iomap.flags |= IOMAP_F_STALE;
    2685:       66 81 4b 42 00 02       orw    $0x200,0x42(%rbx)
                        return 0;
    268b:       e9 aa fc ff ff          jmp    233a <iomap_write_begin+0x15a>
------------------------------------

While the "after" code is this:

------------------------------------
        if (folio == ERR_PTR(-ESTALE)) {
    22ad:       48 83 fd 8c             cmp    $0xffffffffffffff8c,%rbp
    22b1:       0f 84 bc 00 00 00       je     2373 <iomap_write_begin+0x193>
                iter->iomap.flags |= IOMAP_F_STALE;
                return 0;
        }
        if (IS_ERR(folio))
                return PTR_ERR(folio);
    22b7:       89 e8                   mov    %ebp,%eax
        if (IS_ERR(folio))
    22b9:       48 81 fd 00 f0 ff ff    cmp    $0xfffffffffffff000,%rbp
    22c0:       0f 87 82 00 00 00       ja     2348 <iomap_write_begin+0x168>
------------------------------------

The compiler isn't smart enough to re-nest the ifs by recognizing that
folio == ERR_PTR(-ESTALE) is a subset of IS_ERR(folio).

So do you still insist on that un-nesting even though it produces worse code?

Thanks,
Andreas

