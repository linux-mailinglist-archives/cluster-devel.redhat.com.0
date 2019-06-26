Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB1B56DF8
	for <lists+cluster-devel@lfdr.de>; Wed, 26 Jun 2019 17:43:58 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BB54D3004426;
	Wed, 26 Jun 2019 15:43:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 54B165D9D3;
	Wed, 26 Jun 2019 15:43:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CF0693F6E4;
	Wed, 26 Jun 2019 15:43:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5QFhfKX008513 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 26 Jun 2019 11:43:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9F0A15D717; Wed, 26 Jun 2019 15:43:41 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 990545D71B
	for <cluster-devel@redhat.com>; Wed, 26 Jun 2019 15:43:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 866F658E42
	for <cluster-devel@redhat.com>; Wed, 26 Jun 2019 15:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209;
	h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=DVYqe3tpQ8e1sMTCWOSh9xLpYFRFLHE+hBBBu6gUiVY=;
	b=JiqZyiWjMhOWaBcr2IrbgLkM4
	0syeulFERs2blphfx8J9OQQYfDcD66MEDA/eYqMG3YlVaiNtVmnfwdsQ65mUOa5tobSAjIu4o0moB
	8ozOmeOpYAerFJ54x2vEzjiR8SfnDfyWG+bdR1ZUOZNrlL/SYacZFBNxtNQ7BkGu8CuE2RuIHDLu+
	CaRHYuI+HSdl81J/22Qtg+UiLTkGUTCTPoK9RgIw1FJLZsPC0ZS5UU4A0RQGMZLPHDKHcZxxfrX3Z
	j7RrqvM1qVcwEiIAm5WRBQmOct/BZjqliivvm1uRzpyKv/GzpK/wBw3vN8gt+E6H+zEEVMvM/k0vT
	MgqmUKwSQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat
	Linux)) id 1hgA4c-0000SB-CS; Wed, 26 Jun 2019 15:43:02 +0000
Date: Wed, 26 Jun 2019 08:43:02 -0700
From: Christoph Hellwig <hch@infradead.org>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Message-ID: <20190626154302.GA31445@infradead.org>
References: <156151632209.2283456.3592379873620132456.stgit@magnolia>
	<156151633829.2283456.834142172527987802.stgit@magnolia>
	<20190626041133.GB32272@ZenIV.linux.org.uk>
	<20190626153542.GE5171@magnolia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190626153542.GE5171@magnolia>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.39]); Wed, 26 Jun 2019 15:43:29 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]);
	Wed, 26 Jun 2019 15:43:29 +0000 (UTC) for IP:'198.137.202.133'
	DOMAIN:'bombadil.infradead.org' HELO:'bombadil.infradead.org'
	FROM:'BATV+ab1f803c58217d155be4+5785+infradead.org+hch@bombadil.srs.infradead.org'
	RCPT:''
X-RedHat-Spam-Score: -2.399  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE) 198.137.202.133 bombadil.infradead.org 198.137.202.133
	bombadil.infradead.org
	<BATV+ab1f803c58217d155be4+5785+infradead.org+hch@bombadil.srs.infradead.org>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.39
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Cc: shaggy@kernel.org, jfs-discussion@lists.sourceforge.net,
	linux-efi@vger.kernel.org, Jan Kara <jack@suse.cz>,
	linux-btrfs@vger.kernel.org, yuchao0@huawei.com, clm@fb.com,
	adilger.kernel@dilger.ca, matthew.garrett@nebula.com,
	linux-nilfs@vger.kernel.org, cluster-devel@redhat.com,
	linux-ext4@vger.kernel.org, josef@toxicpanda.com,
	reiserfs-devel@vger.kernel.org,
	Al Viro <viro@zeniv.linux.org.uk>, dsterba@suse.com,
	jaegeuk@kernel.org, tytso@mit.edu, ard.biesheuvel@linaro.org,
	linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	linux-xfs@vger.kernel.org, jk@ozlabs.org, jack@suse.com,
	linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
	ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH 2/5] vfs: create a generic checking
 function for FS_IOC_FSSETXATTR
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Wed, 26 Jun 2019 15:43:57 +0000 (UTC)

On Wed, Jun 26, 2019 at 08:35:42AM -0700, Darrick J. Wong wrote:
> > static inline void simple_fill_fsxattr(struct fsxattr *fa, unsigned xflags)
> > {
> > 	memset(fa, 0, sizeof(*fa));
> > 	fa->fsx_xflags = xflags;
> > }
> > 
> > and let the compiler optimize the crap out?
> 
> The v2 series used to do that, but Christoph complained that having a
> helper for a two-line memset and initialization was silly[1] so now we
> have this version.
> 
> I don't mind reinstating it as a static inline helper, but I'd like some
> input from any of the btrfs developers (or you, Al) about which form is
> preferred.

I complained having that helper in btrfs.  I think Al wants a generic
one, which at least makes a little more sense.

That being said I wonder if we should lift these attr ioctls to
file op methods and deal with all that crap in VFS code instead of
having all those duplicated ioctl parsers.

