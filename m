Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 419E354D1B
	for <lists+cluster-devel@lfdr.de>; Tue, 25 Jun 2019 13:03:04 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 48D94369BC;
	Tue, 25 Jun 2019 11:03:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2EC405D9D3;
	Tue, 25 Jun 2019 11:03:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0B83B3D87;
	Tue, 25 Jun 2019 11:03:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5PAxCmn004731 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 25 Jun 2019 06:59:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DFAFB10027B7; Tue, 25 Jun 2019 10:59:12 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx20.extmail.prod.ext.phx2.redhat.com
	[10.5.110.49])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DB21210027BF
	for <cluster-devel@redhat.com>; Tue, 25 Jun 2019 10:59:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 007EC3004426
	for <cluster-devel@redhat.com>; Tue, 25 Jun 2019 10:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209;
	h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Wwjd99RoXuSnHJKoAHqWgUdarmES3VQyay6SQK/R1Zo=;
	b=UwU0highZEA/FGERbHhOX+NGj
	wbOEOfYCrykn4i/NMFvP0XQWLaO76P5pTHVLBqJkG76euT9OEwHgRthOqNy2+bpGfoQffYe+VSjUn
	QLbNyICQ73+5wpZ67NnuWDRQEVMjMQ9n+ScMYd+VXjhbz8KGNZJ7arzmVhIfPVZ6AqQzv7e6MuDSa
	aGu3nC2IVp/W+ZNu5JgLyHLadtwk9OKFT74gLui/zAk4qpMo1UK4kcsXrMvY0K5yWKTJkGWyq3w6u
	d68URRrxr9HRoeZ3xU0m2oIIkykZy8SnVCCE4rPDUJESqTKtzeQYumA5/zO5K0UZUKNm4pEvUaMY8
	Hwh6CeXHA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat
	Linux)) id 1hfjA7-0000tm-GM; Tue, 25 Jun 2019 10:58:55 +0000
Date: Tue, 25 Jun 2019 03:58:55 -0700
From: Christoph Hellwig <hch@infradead.org>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Message-ID: <20190625105855.GD26085@infradead.org>
References: <156116136742.1664814.17093419199766834123.stgit@magnolia>
	<156116140570.1664814.4607468365269898575.stgit@magnolia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <156116140570.1664814.4607468365269898575.stgit@magnolia>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.49]); Tue, 25 Jun 2019 10:59:05 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]);
	Tue, 25 Jun 2019 10:59:05 +0000 (UTC) for IP:'198.137.202.133'
	DOMAIN:'bombadil.infradead.org' HELO:'bombadil.infradead.org'
	FROM:'BATV+c5155a46dc30cc8634d8+5784+infradead.org+hch@bombadil.srs.infradead.org'
	RCPT:''
X-RedHat-Spam-Score: -2.398  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_NONE) 198.137.202.133 bombadil.infradead.org 198.137.202.133
	bombadil.infradead.org
	<BATV+c5155a46dc30cc8634d8+5784+infradead.org+hch@bombadil.srs.infradead.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.49
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Cc: shaggy@kernel.org, jfs-discussion@lists.sourceforge.net,
	linux-efi@vger.kernel.org, Jan Kara <jack@suse.cz>,
	linux-btrfs@vger.kernel.org, yuchao0@huawei.com, clm@fb.com,
	adilger.kernel@dilger.ca, matthew.garrett@nebula.com,
	linux-nilfs@vger.kernel.org, cluster-devel@redhat.com,
	linux-ext4@vger.kernel.org, josef@toxicpanda.com,
	reiserfs-devel@vger.kernel.org, viro@zeniv.linux.org.uk,
	dsterba@suse.com, jaegeuk@kernel.org, tytso@mit.edu,
	ard.biesheuvel@linaro.org, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-xfs@vger.kernel.org, jk@ozlabs.org, jack@suse.com,
	linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
	ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH 4/4] vfs: teach vfs_ioc_fssetxattr_check
 to check extent size hints
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]); Tue, 25 Jun 2019 11:03:03 +0000 (UTC)

On Fri, Jun 21, 2019 at 04:56:45PM -0700, Darrick J. Wong wrote:
> From: Darrick J. Wong <darrick.wong@oracle.com>
> 
> Move the extent size hint checks that aren't xfs-specific to the vfs.
> 
> Signed-off-by: Darrick J. Wong <darrick.wong@oracle.com>
> Reviewed-by: Jan Kara <jack@suse.cz>

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>

