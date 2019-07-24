Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id B511372BEA
	for <lists+cluster-devel@lfdr.de>; Wed, 24 Jul 2019 12:00:45 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DFAF630A8841;
	Wed, 24 Jul 2019 10:00:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DA9045C548;
	Wed, 24 Jul 2019 10:00:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C35C81800206;
	Wed, 24 Jul 2019 10:00:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6OA0Yju010502 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 24 Jul 2019 06:00:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C9EB8620CE; Wed, 24 Jul 2019 10:00:34 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.42])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B8C5601B7;
	Wed, 24 Jul 2019 10:00:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9F37230A8847;
	Wed, 24 Jul 2019 10:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209;
	h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=/MAFxUXpNzbi4KjfrTLt3NyDxXRqZOCjaS3pKnzg3rU=;
	b=ZZcd7Ka0dorUDDVUfi1UN4o90
	ehVjn6m3vk7MR8Ua7fhH+bVC3Zlb1KGryiDONAa8oLUk8nB9/sTDkh0Y2kNacQmbcSIm2TBnySXRr
	okBBjJe5S4tOwVJxq07I/I/BvjqhYxDmsXxaAorTlC6dAUG3Bg/DbcKevXJn12r+6/7THzEVZ/Sem
	V9pwTBvi1nvgWUPttOJLeOwhK/aZphrhxqjXRjPN5FNtxHfTbfuxNRAmbtqWh7SG0lPzgsIj46zY3
	J2pwtxrHDmAIyWdEwrswzselJRaRh4Cy5Ad05+oNkzxyD9g614WCLy/SWJ0LElxfuWAfzLCZmEeVu
	5lsXZ0jEQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat
	Linux)) id 1hqE4U-000222-Nc; Wed, 24 Jul 2019 10:00:30 +0000
Date: Wed, 24 Jul 2019 03:00:30 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Jia-Ju Bai <baijiaju1990@gmail.com>
Message-ID: <20190724100030.GA2239@infradead.org>
References: <20190724084303.1236-1-baijiaju1990@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190724084303.1236-1-baijiaju1990@gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.42]); Wed, 24 Jul 2019 10:00:31 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]);
	Wed, 24 Jul 2019 10:00:31 +0000 (UTC) for IP:'198.137.202.133'
	DOMAIN:'bombadil.infradead.org' HELO:'bombadil.infradead.org'
	FROM:'BATV+1e4efd27347a199fee4d+5813+infradead.org+hch@bombadil.srs.infradead.org'
	RCPT:''
X-RedHat-Spam-Score: -2.398  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_NONE) 198.137.202.133 bombadil.infradead.org 198.137.202.133
	bombadil.infradead.org
	<BATV+1e4efd27347a199fee4d+5813+infradead.org+hch@bombadil.srs.infradead.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.42
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH] fs: gfs2: Fix a null-pointer
 dereference in gfs2_alloc_inode()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Wed, 24 Jul 2019 10:00:44 +0000 (UTC)

On Wed, Jul 24, 2019 at 04:43:03PM +0800, Jia-Ju Bai wrote:
> index 0acc5834f653..c07c3f4f8451 100644
> --- a/fs/gfs2/super.c
> +++ b/fs/gfs2/super.c
> @@ -1728,8 +1728,9 @@ static struct inode *gfs2_alloc_inode(struct super_block *sb)
>  		memset(&ip->i_res, 0, sizeof(ip->i_res));
>  		RB_CLEAR_NODE(&ip->i_res.rs_node);
>  		ip->i_rahead = 0;
> -	}
> -	return &ip->i_inode;
> +		return &ip->i_inode;
> +	} else
> +		return NULL;
>  }

No need for an else after a return.  You probably just want to
return early for the NULL case.

