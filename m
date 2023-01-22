Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE73676BAD
	for <lists+cluster-devel@lfdr.de>; Sun, 22 Jan 2023 09:49:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674377343;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=8SDKIuBosw0Y6gCecomo8g6nVj0vlJmnHgW0J/JWrps=;
	b=irNuTuYHZr1A85pK43gog616kCcLh/Z0zLseDgNV6z003E8p/C7qJRfwM3Gqj1YlwtKcHy
	0IMGuwFJ9bkHFzohXfynmFlkkm9XiAxYuJ+Ytf6mKKd9adTIh+7sUqS1qYfrus5mPTEUnn
	ZTkBwgeBWvbL3n4jaxLY6h8wvgv3aBE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-621-sQTEgzCFMD-rROXoSr8x5g-1; Sun, 22 Jan 2023 03:48:59 -0500
X-MC-Unique: sQTEgzCFMD-rROXoSr8x5g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9792F380670B;
	Sun, 22 Jan 2023 08:48:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 408952026D68;
	Sun, 22 Jan 2023 08:48:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id DA23B1946589;
	Sun, 22 Jan 2023 08:48:56 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 407CE1946586 for <cluster-devel@listman.corp.redhat.com>;
 Sun, 22 Jan 2023 08:48:55 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1F5A414171C0; Sun, 22 Jan 2023 08:48:55 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 17EF51415126
 for <cluster-devel@redhat.com>; Sun, 22 Jan 2023 08:48:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3B50E85A588
 for <cluster-devel@redhat.com>; Sun, 22 Jan 2023 08:48:54 +0000 (UTC)
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-564-ue1fjc7oO2eg3fPRV5_WFA-1; Sun, 22 Jan 2023 03:48:53 -0500
X-MC-Unique: ue1fjc7oO2eg3fPRV5_WFA-1
Received: by mail-pl1-f198.google.com with SMTP id
 s5-20020a170903214500b00195e3b26848so3213948ple.7
 for <cluster-devel@redhat.com>; Sun, 22 Jan 2023 00:48:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8SDKIuBosw0Y6gCecomo8g6nVj0vlJmnHgW0J/JWrps=;
 b=RWjKAK3VQM7VP3b2EJm3juXqAa92v2n+Uz1Zcy2vwJqlwk14TFBWcMWDyc7gxaHb6E
 BZfevBRDoQQUgBEMmlYm3eP0VTMaVFUzfBmMsI9UM7ogP3FCDws7lO6ATYwHvRJHULrA
 nbLaVrqqOlkm6Rzb7d3F39ZDTB6TCnyCREp/YWu+OZm9eYPI/doTAzy4EvIh/E96o387
 bv3aW9qUUdCTEzPHpAClLy1fhULKbCfA3nmRgb2TqudkS2BZ95fdfWIEQaVYnFA/TwKY
 ew30mOgzXd0wirK11Gqc0jAMXEGUd0cQlhWIfE59sWYDNHjec61Nd7EpWLPJSo2Nfas+
 iFdw==
X-Gm-Message-State: AFqh2koQfCxms6szSMw3XHoBUiRw1hFvtlGdnuWmJ/ypQWxtV6E87tnZ
 UZ319bbJGhKCDRtesYffepMhsOfJuKNiM2aqL7Ka/V2CtfUnt0k5ovNR+QfVrhBfsRZcuteHKb3
 6SLK1xzqWy97xzEuW7TCZX/FQQYMOPxXur4sv7A==
X-Received: by 2002:a62:be13:0:b0:58d:b201:84b1 with SMTP id
 l19-20020a62be13000000b0058db20184b1mr2282359pff.41.1674377331214; 
 Sun, 22 Jan 2023 00:48:51 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuwAWLrw38cQ1Ha9xZx3SZuQe/jt+10b3RQAqmklXd4+tytynF8ViRBHXKCC9L1qZVXzs046Wi44O+irVm6SaQ=
X-Received: by 2002:a62:be13:0:b0:58d:b201:84b1 with SMTP id
 l19-20020a62be13000000b0058db20184b1mr2282357pff.41.1674377330917; Sun, 22
 Jan 2023 00:48:50 -0800 (PST)
MIME-Version: 1.0
References: <20230120141150.1278819-1-agruenba@redhat.com>
 <20230121142927.GB6786@lst.de>
In-Reply-To: <20230121142927.GB6786@lst.de>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Sun, 22 Jan 2023 09:48:38 +0100
Message-ID: <CAHc6FU5udwDCBaH8Cm1EMDh8P1_7WwRVU2SXgF-SZmh5pE2-8Q@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: Re: [Cluster-devel] [PATCH] Revert "gfs2: stop using
 generic_writepages in gfs2_ail1_start_one"
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
Cc: linux-fsdevel@vger.kernel.org, cluster-devel@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Sat, Jan 21, 2023 at 3:29 PM Christoph Hellwig <hch@lst.de> wrote:
>
> > +     struct address_space *mapping = data;
> > +     int ret = mapping->a_ops->writepage(page, wbc);
> > +     mapping_set_error(mapping, ret);
> > +     return ret;
>
> I guess beggars can't be choosers, but is there a chance to directly
> call the relevant gfs2 writepage methods here instead of the
> ->writepage call?

Yes, we could wrap struct address_space_operations and move the
writepage method into its wrapper structure relatively easily, but
that would still leave things in a messy state. So I'd really like to
reassess the validity of commit 5ac048bb7ea6 ("GFS2: Use
filemap_fdatawrite() to write back the AIL") before deciding to go
that way.

Also, we're really trying to iterate the list of inodes that are part
of the transaction here, not the list of blocks, and if we stick with
that, an actual list of inodes would help. That would be the
complement of our list of ordered inodes in a sense.

Until then, I'd like to stick with the simplest possible solution
though, which seems to be this.

> Otherwise this looks good:
>
> Acked-by: Christoph Hellwig <hch@lst.de>

Thanks a lot,
Andreas

