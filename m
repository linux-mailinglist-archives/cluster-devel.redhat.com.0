Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id B701811CA94
	for <lists+cluster-devel@lfdr.de>; Thu, 12 Dec 2019 11:23:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1576146216;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=eDIed+Zi+5UTjYPK4Ba5LwS+W5X2j//mWbmGXa+L2Fk=;
	b=dIHjxhiSyxfxXRIam0hlZgSWZ0IPyF1u89Pc8jqVMBlB2MCphaIuINsTkh1B5tvjmflyD7
	bt53sSTGyfoILw2JvxxhFNmzdTXIth45lOMAQ+PVSL0g++4X3jYH6Er9z+3yVtNu69aG+r
	Eb4cDkiItRz7bqvuyhsK9lF1bcqZxOM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-mM4ja_MQOy-MQrG9Y2uYgw-1; Thu, 12 Dec 2019 05:23:31 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 13D56DBAC;
	Thu, 12 Dec 2019 10:23:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2335060C05;
	Thu, 12 Dec 2019 10:23:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2326883729;
	Thu, 12 Dec 2019 10:23:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xBCANJvo024292 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 12 Dec 2019 05:23:19 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1D6EC2166B27; Thu, 12 Dec 2019 10:23:19 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 197BB2166B2A
	for <cluster-devel@redhat.com>; Thu, 12 Dec 2019 10:23:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A87ED8002F5
	for <cluster-devel@redhat.com>; Thu, 12 Dec 2019 10:23:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-39-_Gl9ctCzPpKrb7hurObYVw-1; Thu, 12 Dec 2019 05:23:15 -0500
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1ifLC1-0007uW-Kb; Thu, 12 Dec 2019 09:55:33 +0000
Date: Thu, 12 Dec 2019 01:55:33 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <20191212095533.GA23944@infradead.org>
References: <20191210102916.842-1-agruenba@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191210102916.842-1-agruenba@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-MC-Unique: _Gl9ctCzPpKrb7hurObYVw-1
X-MC-Unique: mM4ja_MQOy-MQrG9Y2uYgw-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xBCANJvo024292
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	cluster-devel@redhat.com, linux-kernel@vger.kernel.org,
	"Darrick J. Wong" <darrick.wong@oracle.com>
Subject: Re: [Cluster-devel] [PATCH] iomap: Export iomap_page_create and
 iomap_set_range_uptodate
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

At very least this needs to be a EXPORT_SYMBOL_GPL in sent in a series
with the actual user.  But I'm not all that happy about exporting such
low-level helpers.  Can't we come up with a useful higher level
primitive instead?


