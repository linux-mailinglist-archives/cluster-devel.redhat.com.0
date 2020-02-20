Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 07B67166098
	for <lists+cluster-devel@lfdr.de>; Thu, 20 Feb 2020 16:12:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582211570;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=BzUxnIYLZDkalUHwMQhVH3L2hQLLiGXN2kbZ6i87T7s=;
	b=LnNo3w1fVZGOTva0q08TzX1Mw+X0WEGGDWVZ2wobV+EjNnNZ/W7D3Z74BX/hkeJqI7ggKO
	1MW+p1GWI8efTL5b8zqzFKvM5Iz06855UOt9HQTYruJt1vifcfezkrjzSEUkeJiY+eJ2EY
	i1+T9ZmHkIbt6N5IILNNJqrSKR7wVzk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-72-o4ToOAVwN5OcOmJshOdGqw-1; Thu, 20 Feb 2020 10:12:48 -0500
X-MC-Unique: o4ToOAVwN5OcOmJshOdGqw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 941BC13E2;
	Thu, 20 Feb 2020 15:12:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 24BB610001AE;
	Thu, 20 Feb 2020 15:12:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5A3E835B17;
	Thu, 20 Feb 2020 15:12:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01KFAw0Q025332 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 20 Feb 2020 10:10:58 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E2F911227927; Thu, 20 Feb 2020 15:10:57 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DEB291055536
	for <cluster-devel@redhat.com>; Thu, 20 Feb 2020 15:10:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BCF088001EA
	for <cluster-devel@redhat.com>; Thu, 20 Feb 2020 15:10:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-188-E0RwovguMqq2_KvBqzV2Vg-1; Thu, 20 Feb 2020 10:10:53 -0500
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1j4nTU-00007F-C8; Thu, 20 Feb 2020 15:10:48 +0000
Date: Thu, 20 Feb 2020 07:10:48 -0800
From: Matthew Wilcox <willy@infradead.org>
To: Zi Yan <ziy@nvidia.com>
Message-ID: <20200220151048.GW24185@bombadil.infradead.org>
References: <20200219210103.32400-1-willy@infradead.org>
	<20200219210103.32400-11-willy@infradead.org>
	<5D7CE6BD-FABD-4901-AEF0-E0F10FC00EB1@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <5D7CE6BD-FABD-4901-AEF0-E0F10FC00EB1@nvidia.com>
X-MC-Unique: E0RwovguMqq2_KvBqzV2Vg-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01KFAw0Q025332
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH v7 10/24] mm: Add readahead address
	space operation
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Thu, Feb 20, 2020 at 10:00:30AM -0500, Zi Yan wrote:
> > +/* The index of the first page in this readahead block */
> > +static inline unsigned int readahead_index(struct readahead_control *r=
ac)
> > +{
> > +=09return rac->_index;
> > +}
>=20
> rac->_index is pgoff_t, so readahead_index() should return the same type,=
 right?
> BTW, pgoff_t is unsigned long.

Oh my goodness!  Thank you for spotting that.  Fortunately, it's only
currently used by tracepoints, so it wasn't causing any trouble, but
that's a nasty landmine to leave lying around.  Fixed:

static inline pgoff_t readahead_index(struct readahead_control *rac)


