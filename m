Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 51182167D04
	for <lists+cluster-devel@lfdr.de>; Fri, 21 Feb 2020 13:00:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582286443;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=CUXmf1PVraWfZh6aJMZMgX6bmsgCN8YQZWWhi7T5pXw=;
	b=ekVjJgrfHFlzZs6y9PojBDYmUkctHmBSUOSpOajiI2JOxLXvo/eP/EYMLIwbAM38za4GeU
	6d2saQbhJsP+R/mIOfuPrJntHwc5bkiMFdoqBkC2vUuvPJonhzl2qdmY4joX76bh7WDFUt
	5IGkanhMWIqzi1XNW2gU6HhXD55xgao=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455-W-K2Sii2NYyrosVNbUjOLg-1; Fri, 21 Feb 2020 07:00:41 -0500
X-MC-Unique: W-K2Sii2NYyrosVNbUjOLg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0F1C9107ACC5;
	Fri, 21 Feb 2020 12:00:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C184C790CF;
	Fri, 21 Feb 2020 12:00:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8CF01860C1;
	Fri, 21 Feb 2020 12:00:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01LC0O0F026080 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 21 Feb 2020 07:00:25 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C60DE2166B30; Fri, 21 Feb 2020 12:00:24 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C20FB2166B2B
	for <cluster-devel@redhat.com>; Fri, 21 Feb 2020 12:00:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2E51F8007C9
	for <cluster-devel@redhat.com>; Fri, 21 Feb 2020 12:00:22 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-126-RjT5_6ZKMfKTO0A61sevEg-1;
	Fri, 21 Feb 2020 07:00:18 -0500
X-MC-Unique: RjT5_6ZKMfKTO0A61sevEg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 9004EAF2B;
	Fri, 21 Feb 2020 12:00:16 +0000 (UTC)
Received: by ds.suse.cz (Postfix, from userid 10065)
	id B113FDA70E; Fri, 21 Feb 2020 12:59:58 +0100 (CET)
Date: Fri, 21 Feb 2020 12:59:58 +0100
From: David Sterba <dsterba@suse.cz>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200221115957.GE2902@twin.jikos.cz>
Mail-Followup-To: dsterba@suse.cz, Matthew Wilcox <willy@infradead.org>,
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-btrfs@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	ocfs2-devel@oss.oracle.com, linux-xfs@vger.kernel.org
References: <20200219210103.32400-1-willy@infradead.org>
	<20200220175400.GB2902@twin.jikos.cz>
	<20200220223909.GB24185@bombadil.infradead.org>
MIME-Version: 1.0
In-Reply-To: <20200220223909.GB24185@bombadil.infradead.org>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01LC0O0F026080
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	dsterba@suse.cz, linux-kernel@vger.kernel.org,
	cluster-devel@redhat.com, linux-mm@kvack.org,
	ocfs2-devel@oss.oracle.com, linux-fsdevel@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH v7 00/23] Change readahead API
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
Reply-To: dsterba@suse.cz
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Thu, Feb 20, 2020 at 02:39:09PM -0800, Matthew Wilcox wrote:
> > >  - Now passes an xfstests run on ext4!
> >=20
> > On btrfs it still chokes on the first test btrfs/001, with the followin=
g
> > warning, the test is stuck there.
>=20
> Thanks.  The warning actually wasn't the problem, but it did need to
> be addressed.  I got a test system up & running with btrfs, and it's
> currently on generic/027 with the following patch:

Thanks, with the fix applied the first 10 tests passed, I'll let the
testsuite finish and let you know if ther are more warnings and such.


