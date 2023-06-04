Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A930A721481
	for <lists+cluster-devel@lfdr.de>; Sun,  4 Jun 2023 05:35:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685849758;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=CcaX1YqTccJ2pm/jjC3O01CP48RRVQ+VTKTRem2EehI=;
	b=VtMtOTDILKobxw7QMamTPboJo6pX4TgZBE3ciTBmcqlsEZ1AeM4/vlciCXwUeh0rw+jsMM
	8yHXbjU+YaEI1WO7sBnqs4HBdBewI3UR6KobhlmxLA0N5bDIP0k5MdYcvPKAU7ltwUUugE
	vvS03o1k5py12TRLAeun7jpjf8/yo3k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-320-d_Y0XBauMYGg4CvBq9haSw-1; Sat, 03 Jun 2023 23:35:50 -0400
X-MC-Unique: d_Y0XBauMYGg4CvBq9haSw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CBD4C8032EF;
	Sun,  4 Jun 2023 03:35:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9100C8162;
	Sun,  4 Jun 2023 03:35:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3CED019465A3;
	Sun,  4 Jun 2023 03:35:47 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9A5731946595 for <cluster-devel@listman.corp.redhat.com>;
 Sun,  4 Jun 2023 03:35:45 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6BD3240CFD46; Sun,  4 Jun 2023 03:35:45 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 63F9240CFD45
 for <cluster-devel@redhat.com>; Sun,  4 Jun 2023 03:35:45 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 48DDA1C041A2
 for <cluster-devel@redhat.com>; Sun,  4 Jun 2023 03:35:45 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-102-GuULlhE0OKWzP_4VogiLwg-1; Sat,
 03 Jun 2023 23:35:38 -0400
X-MC-Unique: GuULlhE0OKWzP_4VogiLwg-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1q5eWk-00Ahrt-Dz; Sun, 04 Jun 2023 03:35:34 +0000
Date: Sun, 4 Jun 2023 04:35:34 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <ZHwGhsDPYZQlYksK@casper.infradead.org>
References: <20230517032442.1135379-1-willy@infradead.org>
 <20230517032442.1135379-4-willy@infradead.org>
 <CAHc6FU4G1F1OXC233hT7_Vog9F8GNZyeLwsi+01USSXhFBNc_A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHc6FU4G1F1OXC233hT7_Vog9F8GNZyeLwsi+01USSXhFBNc_A@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: Re: [Cluster-devel] [PATCH 3/6] gfs2: Convert
 gfs2_write_jdata_page() to gfs2_write_jdata_folio()
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
Cc: Hannes Reinecke <hare@suse.com>, cluster-devel <cluster-devel@redhat.com>,
 Luis Chamberlain <mcgrof@kernel.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: infradead.org
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jun 03, 2023 at 11:34:14AM +0200, Andreas Gruenbacher wrote:
> >   * This is the same as calling block_write_full_page, but it also
> >   * writes pages outside of i_size
> >   */
> > -static int gfs2_write_jdata_page(struct page *page,
> > +static int gfs2_write_jdata_folio(struct folio *folio,
> >                                  struct writeback_control *wbc)
> >  {
> > -       struct inode * const inode = page->mapping->host;
> > +       struct inode * const inode = folio->mapping->host;
> >         loff_t i_size = i_size_read(inode);
> > -       const pgoff_t end_index = i_size >> PAGE_SHIFT;
> > -       unsigned offset;
> >
> > +       if (folio_pos(folio) >= i_size)
> > +               return 0;
> 
> Function gfs2_write_jdata_page was originally introduced as
> gfs2_write_full_page in commit fd4c5748b8d3 ("gfs2: writeout truncated
> pages") to allow writing pages even when they are beyond EOF, as the
> function description documents.

Well, that was stupid of me.

> This hack was added because simply skipping journaled pages isn't
> enough on gfs2; before a journaled page can be freed, it needs to be
> marked as "revoked" in the journal. Journal recovery will then skip
> the revoked blocks, which allows them to be reused for regular,
> non-journaled data. We can end up here in contexts in which we cannot
> "revoke" pages, so instead, we write the original pages even when they
> are beyond EOF. This hack could be revisited, but it's pretty nasty
> code to pick apart.
> 
> So at least the above if needs to go for now.

Understood.  So we probably don't want to waste time zeroing the folio
if it is entirely beyond i_size, right?  Because at the moment we'd
zero some essentially random part of the folio if I just take out the
check.  Should it look like this?

        if (folio_pos(folio) < i_size &&
            i_size < folio_pos(folio) + folio_size(folio))
               folio_zero_segment(folio, offset_in_folio(folio, i_size),
                                folio_size(folio));

