Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF4A618F1E
	for <lists+cluster-devel@lfdr.de>; Fri,  4 Nov 2022 04:37:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667533036;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=kCztCif6DGnUVPea69d1j6HBte1tInJ//NGbT2adCtA=;
	b=Oj4WXkwGf+Vb1f+wAo8xBKvQYPoXbPVHyS9D6j9skSjsPuHxcGwwDYuPyye+acNEsz5pxq
	8HzFScnhMMULPjUQHR4fPIvDjLume9U16c1wLTToOB0bbP/2uWScp3JAlXeNAJ5O4gAOi4
	82KWWS495zwYKessgzk2lNeIT0wO+PA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-551-LeJREGIzNM2AQq-ier5d4g-1; Thu, 03 Nov 2022 23:37:09 -0400
X-MC-Unique: LeJREGIzNM2AQq-ier5d4g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 87806800186;
	Fri,  4 Nov 2022 03:37:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0733F2166B26;
	Fri,  4 Nov 2022 03:37:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7CF6219465B2;
	Fri,  4 Nov 2022 03:37:07 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 877191946594 for <cluster-devel@listman.corp.redhat.com>;
 Fri,  4 Nov 2022 03:37:06 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 752BB4EA5A; Fri,  4 Nov 2022 03:37:06 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D7B618EB4
 for <cluster-devel@redhat.com>; Fri,  4 Nov 2022 03:37:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4EBD2858F13
 for <cluster-devel@redhat.com>; Fri,  4 Nov 2022 03:37:06 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-518-30-07TFBO9W08gcrIL9o0w-1; Thu, 03 Nov 2022 23:37:04 -0400
X-MC-Unique: 30-07TFBO9W08gcrIL9o0w-1
Received: by mail-pg1-f181.google.com with SMTP id s196so3366357pgs.3
 for <cluster-devel@redhat.com>; Thu, 03 Nov 2022 20:37:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kCztCif6DGnUVPea69d1j6HBte1tInJ//NGbT2adCtA=;
 b=OwU73kClKaKsE7fC9XfrajhbbuKs+IiJpGG6N+Lkiaj2bPScFTv5Cou0vAoMUIaXMf
 wuni7RqfNl3IlD36Cxdpnq/NlGMWtnMtg87YI7QpsT24ZdKyqhij4TyczMKsbzSwhTIW
 9FtNwd71qD/QeYZ1fEHZHKh3D3mqb8lxM677wnb+wXebaMzCY10KH1K46Kit2/rwCc2l
 nS814FcNf95Xq96uIsqKyRF5i5LO/AnL40uUyZW+FYqRKCKhmsSSmZdoAqxOG23/qsOW
 w+gNmSBL3mhXVnGyJGZQlCfJOI2WaoES0Rsv+9Z18DEMLz+2FNPa0GC7T1H+YpkoZUF+
 6Wog==
X-Gm-Message-State: ACrzQf0kn1fnYClo+X/HzzaE+1DV755dTtP25EwhKbvMoI2qJ7RNgmwJ
 GeCqLyVKZwzIrJ0+cHuPj5UkAQ==
X-Google-Smtp-Source: AMsMyM7NwhgMGw/Ejg/10+QrYuOi1WfTIe60hww1ZNfzsfJwCZnIyT2jB8JwYZIzMahLdSnJ6wzgKQ==
X-Received: by 2002:a05:6a00:2396:b0:56c:b770:eda6 with SMTP id
 f22-20020a056a00239600b0056cb770eda6mr33239633pfc.38.1667533023291; 
 Thu, 03 Nov 2022 20:37:03 -0700 (PDT)
Received: from dread.disaster.area (pa49-181-106-210.pa.nsw.optusnet.com.au.
 [49.181.106.210]) by smtp.gmail.com with ESMTPSA id
 x13-20020a170902a38d00b001830ed575c3sm1430190pla.117.2022.11.03.20.37.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 20:37:02 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
 (envelope-from <david@fromorbit.com>)
 id 1oqnVr-00A1XB-Bm; Fri, 04 Nov 2022 14:36:59 +1100
Date: Fri, 4 Nov 2022 14:36:59 +1100
From: Dave Chinner <david@fromorbit.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Message-ID: <20221104033659.GA2703033@dread.disaster.area>
References: <20220901220138.182896-1-vishal.moola@gmail.com>
 <20220901220138.182896-5-vishal.moola@gmail.com>
 <20221018210152.GH2703033@dread.disaster.area>
 <Y2RAdUtJrOJmYU4L@fedora>
 <20221104003235.GZ2703033@dread.disaster.area>
 <Y2R8rRr0ZdrlT32m@magnolia>
MIME-Version: 1.0
In-Reply-To: <Y2R8rRr0ZdrlT32m@magnolia>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: Re: [Cluster-devel] [PATCH 04/23] page-writeback: Convert
 write_cache_pages() to use filemap_get_folios_tag()
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
Cc: linux-cifs@vger.kernel.org, cluster-devel@redhat.com,
 linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, Vishal Moola <vishal.moola@gmail.com>,
 linux-mm@kvack.org, linux-nilfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 03, 2022 at 07:45:01PM -0700, Darrick J. Wong wrote:
> On Fri, Nov 04, 2022 at 11:32:35AM +1100, Dave Chinner wrote:
> > On Thu, Nov 03, 2022 at 03:28:05PM -0700, Vishal Moola wrote:
> > > On Wed, Oct 19, 2022 at 08:01:52AM +1100, Dave Chinner wrote:
> > > > On Thu, Sep 01, 2022 at 03:01:19PM -0700, Vishal Moola (Oracle) wrote:
> > > > > -			BUG_ON(PageWriteback(page));
> > > > > -			if (!clear_page_dirty_for_io(page))
> > > > > +			BUG_ON(folio_test_writeback(folio));
> > > > > +			if (!folio_clear_dirty_for_io(folio))
> > > > >  				goto continue_unlock;
> > > > >  
> > > > >  			trace_wbc_writepage(wbc, inode_to_bdi(mapping->host));
> > > > > -			error = (*writepage)(page, wbc, data);
> > > > > +			error = writepage(&folio->page, wbc, data);
> > > > 
> > > > Yet, IIUC, this treats all folios as if they are single page folios.
> > > > i.e. it passes the head page of a multi-page folio to a callback
> > > > that will treat it as a single PAGE_SIZE page, because that's all
> > > > the writepage callbacks are currently expected to be passed...
> > > > 
> > > > So won't this break writeback of dirty multipage folios?
> > > 
> > > Yes, it appears it would. But it wouldn't because its already 'broken'.
> > 
> > It is? Then why isn't XFS broken on existing kernels? Oh, we don't
> > know because it hasn't been tested?
> > 
> > Seriously - if this really is broken, and this patchset further
> > propagating the brokeness, then somebody needs to explain to me why
> > this is not corrupting data in XFS.
> 
> It looks like iomap_do_writepage finds the folio size correctly
> 
> 	end_pos = folio_pos(folio) + folio_size(folio);
> 
> and iomap_writpage_map will map out the correct number of blocks
> 
> 	unsigned nblocks = i_blocks_per_folio(inode, folio);
> 
> 	for (i = 0; i < nblocks && pos < end_pos; i++, pos += len) {
> 
> right?

Yup, that's how I read it, too.

But my recent experience with folios involved being repeatedly
burnt by edge case corruptions due to multipage folios showing up
when and where I least expected them.

Hence doing a 1:1 conversion of page based code to folio based code
and just assuming large folios will work without any testing seems
akin to playing russian roulette with loose cannons that have been
doused with napalm and then set on fire by an air-dropped barrel
bomb...

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com

