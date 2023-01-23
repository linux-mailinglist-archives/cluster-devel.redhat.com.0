Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0956780B0
	for <lists+cluster-devel@lfdr.de>; Mon, 23 Jan 2023 17:00:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674489638;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=sUGIH2I54cp4HbnMiIaY15PfXULieuiQ0sW9X9yG6Sc=;
	b=SvqriFC4iUDN2nDiMpNX9G50FBtfw9sq+EIpkwGgXGWaa9WeisfzchZCZ93TlzXRDPuEyG
	KGdrhnaofj4tT9v++hB5ugvNq8OUjje4d0LdIwh31/Ju+tMYyPgkqRguIYu6nTTFrQYW1M
	01Jcx8KX48hDHuFlU1Q2kfBQTtXeRFw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-648-YtgLWjNdOUGULj6NgrKFDA-1; Mon, 23 Jan 2023 11:00:33 -0500
X-MC-Unique: YtgLWjNdOUGULj6NgrKFDA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 23884101A52E;
	Mon, 23 Jan 2023 16:00:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D1EA940C115E;
	Mon, 23 Jan 2023 16:00:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7A8141946594;
	Mon, 23 Jan 2023 16:00:18 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8FEB61946589 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 23 Jan 2023 16:00:17 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 79100140EBF4; Mon, 23 Jan 2023 16:00:17 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 70AC71415108
 for <cluster-devel@redhat.com>; Mon, 23 Jan 2023 16:00:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5386B1C08781
 for <cluster-devel@redhat.com>; Mon, 23 Jan 2023 16:00:17 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-522-tHEhR1KiOWygyjAN3iV1tg-1; Mon,
 23 Jan 2023 11:00:15 -0500
X-MC-Unique: tHEhR1KiOWygyjAN3iV1tg-1
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2FA6A1F749;
 Mon, 23 Jan 2023 15:50:29 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D1B05134F5;
 Mon, 23 Jan 2023 15:50:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id euY6MsSszmOdYgAAMHmgww
 (envelope-from <dsterba@suse.cz>); Mon, 23 Jan 2023 15:50:28 +0000
Date: Mon, 23 Jan 2023 16:44:47 +0100
From: David Sterba <dsterba@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20230123154447.GP11562@twin.jikos.cz>
References: <20230121065755.1140136-1-hch@lst.de>
 <20230121065755.1140136-8-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20230121065755.1140136-8-hch@lst.de>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: Re: [Cluster-devel] [PATCH 7/7] mm: return an ERR_PTR from
 __filemap_get_folio
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
Reply-To: dsterba@suse.cz
Cc: linux-xfs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>,
 cluster-devel@redhat.com, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-ext4@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jan 21, 2023 at 07:57:55AM +0100, Christoph Hellwig wrote:
> Instead of returning NULL for all errors, distinguish between:
> 
>  - no entry found and not asked to allocated (-ENOENT)
>  - failed to allocate memory (-ENOMEM)
>  - would block (-EAGAIN)
> 
> so that callers don't have to guess the error based on the passed
> in flags.
> 
> Also pass through the error through the direct callers:
> filemap_get_folio, filemap_lock_folio filemap_grab_folio
> and filemap_get_incore_folio.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  fs/afs/dir.c             | 10 +++++-----
>  fs/afs/dir_edit.c        |  2 +-
>  fs/afs/write.c           |  4 ++--

For

>  fs/btrfs/disk-io.c       |  2 +-

Acked-by: David Sterba <dsterba@suse.com>

