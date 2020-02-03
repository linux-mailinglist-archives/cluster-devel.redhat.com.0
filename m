Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 95713150ED9
	for <lists+cluster-devel@lfdr.de>; Mon,  3 Feb 2020 18:44:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580751887;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=vQcqXAk2nN39DHXZDNgxEWHPoV2Alt02f4vkzHICU+U=;
	b=NUaNdEKn0nb6B6j/ZoRWg42pOA0RccbFx7MNJ86Qtv4bV10Fvb730XlnPnMb5uApNwmIFO
	Ad2pz72FzwoRZMt1e7flLk9Vr30km9SVpbc2EMOyPnwSOKy3nGqy/i3ZvTS83QvS1M6/BY
	cbz5WYJE+4PMY8QBgpW1lzS+gphVgiE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-359--jVLVU3yNXaRoxwnz4gK8g-1; Mon, 03 Feb 2020 12:44:44 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0081F61181;
	Mon,  3 Feb 2020 17:44:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2ED6960BE0;
	Mon,  3 Feb 2020 17:44:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E25158172A;
	Mon,  3 Feb 2020 17:44:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 013HiU3t017263 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 3 Feb 2020 12:44:30 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 50EA92166B27; Mon,  3 Feb 2020 17:44:30 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4CDD12166B2B
	for <cluster-devel@redhat.com>; Mon,  3 Feb 2020 17:44:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3EACC185A7B9
	for <cluster-devel@redhat.com>; Mon,  3 Feb 2020 17:44:28 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-299-gpYEe0N1NCWfWaXF6aXwHA-1;
	Mon, 03 Feb 2020 12:44:24 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
	id 393EE68B20; Mon,  3 Feb 2020 18:44:21 +0100 (CET)
Date: Mon, 3 Feb 2020 18:44:21 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jan Kara <jack@suse.cz>
Message-ID: <20200203174421.GB20001@lst.de>
References: <20200114161225.309792-1-hch@lst.de>
	<20200116140004.GE8446@quack2.suse.cz>
MIME-Version: 1.0
In-Reply-To: <20200116140004.GE8446@quack2.suse.cz>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-MC-Unique: gpYEe0N1NCWfWaXF6aXwHA-1
X-MC-Unique: -jVLVU3yNXaRoxwnz4gK8g-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 013HiU3t017263
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, Andrew Morton <akpm@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-mm@kvack.org, Ingo Molnar <mingo@redhat.com>,
	linux-fsdevel@vger.kernel.org, Waiman Long <longman@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>, linux-ext4@vger.kernel.org,
	Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>
Subject: Re: [Cluster-devel] RFC: hold i_rwsem until aio completes
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
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Thu, Jan 16, 2020 at 03:00:04PM +0100, Jan Kara wrote:
> I'd like to note that using i_dio_count has also one advantage you didn't
> mention. For AIO case, if you need to hold i_rwsem in exclusive mode,
> holding the i_rwsem just for submission part is a significant performance
> advantage (shorter lock hold times allow for higher IO parallelism). I
> guess this could be mitigated by downgrading the lock to shared mode
> once the IO is submitted. But there will be still some degradation visibl=
e
> for the cases of mixed exclusive and shared acquisitions because shared
> holders will be blocking exclusive ones for longer time.
>=20
> This may be especially painful for filesystems that don't implement DIO
> overwrites with i_rwsem in shared mode...

True.  Fortunately there are patches for ext4 out to move over to that
scheme.  gfs2 will need a little more attention, but that also for other
reasons.


