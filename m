Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id 6B2C01944B3
	for <lists+cluster-devel@lfdr.de>; Thu, 26 Mar 2020 17:54:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585241689;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=6aVP5oa0hAAdJUlHkvOLjhq82/P6HQrJkmUEZIxZBbI=;
	b=Qq53NGORRxPYNPbzrhN2cJRpcovASuFKBa5L21At1bhexmKM4hPElJckmTNS92H/sRdVBt
	qaoIvXr3K6e+SNJZKuOFCtxbNw4+jofOwSE+kKEGoJMd6N6hwwa9q87eaPwYXdqDFVpeni
	XloPclHYhvEwzN13N5jWgZErPdtqDio=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-238-YKwq3KV0NjyjCGxrQYoKNQ-1; Thu, 26 Mar 2020 12:54:47 -0400
X-MC-Unique: YKwq3KV0NjyjCGxrQYoKNQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B4BF7DBAC;
	Thu, 26 Mar 2020 16:54:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E1F9A10027B9;
	Thu, 26 Mar 2020 16:54:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id ECC278A03D;
	Thu, 26 Mar 2020 16:54:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02QGsaFG001132 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 26 Mar 2020 12:54:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AE7162166B2C; Thu, 26 Mar 2020 16:54:36 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AA9D42166B2B
	for <cluster-devel@redhat.com>; Thu, 26 Mar 2020 16:54:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4FAE0185A78F
	for <cluster-devel@redhat.com>; Thu, 26 Mar 2020 16:54:34 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-222-WHxcgWuvPQ-027Ka39ERFg-1;
	Thu, 26 Mar 2020 12:54:31 -0400
X-MC-Unique: WHxcgWuvPQ-027Ka39ERFg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 9B509ADF1;
	Thu, 26 Mar 2020 16:54:29 +0000 (UTC)
Received: by ds.suse.cz (Postfix, from userid 10065)
	id 350BDDA730; Thu, 26 Mar 2020 17:53:56 +0100 (CET)
Date: Thu, 26 Mar 2020 17:53:56 +0100
From: David Sterba <dsterba@suse.cz>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200326165356.GI5920@twin.jikos.cz>
Mail-Followup-To: dsterba@suse.cz, Matthew Wilcox <willy@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-btrfs@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	ocfs2-devel@oss.oracle.com, linux-xfs@vger.kernel.org,
	William Kucharski <william.kucharski@oracle.com>
References: <20200323202259.13363-1-willy@infradead.org>
	<20200323202259.13363-18-willy@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20200323202259.13363-18-willy@infradead.org>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02QGsaFG001132
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, William Kucharski <william.kucharski@oracle.com>,
	linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
	linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH v10 17/25] btrfs: Convert from readpages
	to readahead
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Mon, Mar 23, 2020 at 01:22:51PM -0700, Matthew Wilcox wrote:
> From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
>=20
> Implement the new readahead method in btrfs using the new
> readahead_page_batch() function.
>=20
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> Reviewed-by: William Kucharski <william.kucharski@oracle.com>

Sorry for late reply,

Reviewed-by: David Sterba <dsterba@suse.com>


