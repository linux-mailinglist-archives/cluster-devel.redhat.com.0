Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0B05B64EE
	for <lists+cluster-devel@lfdr.de>; Tue, 13 Sep 2022 03:09:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1663031380;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=/XsoyqrT3QB1JAOnynnNk+cD1xAIdvUlxSJ4ed6XIdU=;
	b=dUEEy83as8fZiSfr/tTN55V/GmbbRlKpU/dyEgoeA/J3LQVIg0qZRmaRfo7GwWGt+Gersb
	5PiNPK3c3qJrp22yBJ3TVHIsOXaajroD+y6l5nf3Eu0voiTLoxLjb3zcx4PmhyG9woIrwQ
	OjG7u/KXaZv9qxU/JffA9vpc6vcqvn8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-656-FIGlqQwKMjSZKge_V9gFSg-1; Mon, 12 Sep 2022 21:09:33 -0400
X-MC-Unique: FIGlqQwKMjSZKge_V9gFSg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 04220101A56D;
	Tue, 13 Sep 2022 01:09:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 204281121315;
	Tue, 13 Sep 2022 01:09:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id BB4151946A45;
	Tue, 13 Sep 2022 01:09:28 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3F97E1946A40 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 13 Sep 2022 01:09:28 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2C62040C2065; Tue, 13 Sep 2022 01:09:28 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 28D3940C2064
 for <cluster-devel@redhat.com>; Tue, 13 Sep 2022 01:09:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1242A3806653
 for <cluster-devel@redhat.com>; Tue, 13 Sep 2022 01:09:28 +0000 (UTC)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com
 [209.85.217.52]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-520-ylkwCWc1NtKsnFBS0aEsYA-1; Mon, 12 Sep 2022 21:09:26 -0400
X-MC-Unique: ylkwCWc1NtKsnFBS0aEsYA-1
Received: by mail-vs1-f52.google.com with SMTP id k2so10810420vsk.8
 for <cluster-devel@redhat.com>; Mon, 12 Sep 2022 18:09:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=/XsoyqrT3QB1JAOnynnNk+cD1xAIdvUlxSJ4ed6XIdU=;
 b=ETY1mw+cimCgj20SdCSvH3aUOCiQY3moaa8qJUAu6V8WGEy73vjoolDFC313AGQeHb
 d+4fHBotUX7AvZAeZpvUUOQLrxXXy6i05Dg2zr0KGaodAjr8uqrJTbmsLCXH6+fv4vLn
 YlJykm7i8HxSw9AWtdnesJM2WM43TuuU8190tYFoF58ojiQ/cOu1UDk+MjL24t2mzCus
 7QVWPRYYuJs4YHH3WWuHzuWNlHJ+AZzAgYI4+03rA452AHAEJv25bwf80HuWhDH+RoaZ
 tRo4hKhafECQ3lrLnFmMAyNhRWdsSThTnqRyI7r+qC4WWRkTw9yWn7zRWu/H9SVRQ0xk
 dkVw==
X-Gm-Message-State: ACgBeo29NE8Yg2Oy9z3E4k82sMan2sp9gcnv+ghFr1eGZ9LuZFeI1+d8
 kAM0Tuek7XEmEmrhpU2lXgtUL8TKUVU7v1c/Z8I=
X-Google-Smtp-Source: AA6agR4EqnqQ8u4MAgskdLzYc7FBqMGiJOS2HCVnpmnuXUvK+QJK2TMCY2lWLmDeQ8q/znqGKGcFd82tz2HFf86kF7E=
X-Received: by 2002:a05:6102:5709:b0:390:e360:88e8 with SMTP id
 dg9-20020a056102570900b00390e36088e8mr9131856vsb.22.1663031365543; Mon, 12
 Sep 2022 18:09:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220912182224.514561-1-vishal.moola@gmail.com>
 <20220912182224.514561-19-vishal.moola@gmail.com>
In-Reply-To: <20220912182224.514561-19-vishal.moola@gmail.com>
From: Ryusuke Konishi <konishi.ryusuke@gmail.com>
Date: Tue, 13 Sep 2022 10:09:08 +0900
Message-ID: <CAKFNMokZ02Ax9J3Ns_Q2PO8oeg+G7kgqQS7kMJMxSiX92_Vwzg@mail.gmail.com>
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: Re: [Cluster-devel] [PATCH v2 18/23] nilfs2: Convert
 nilfs_lookup_dirty_data_buffers() to use filemap_get_folios_tag()
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
Cc: linux-cifs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 13, 2022 at 3:30 AM Vishal Moola (Oracle) wrote:
>
> Convert function to use folios throughout. This is in preparation for
> the removal of find_get_pages_range_tag().
>
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> ---
>  fs/nilfs2/segment.c | 29 ++++++++++++++++-------------
>  1 file changed, 16 insertions(+), 13 deletions(-)

Acked-by: Ryusuke Konishi <konishi.ryusuke@gmail.com>

Looks good.   Thank you for reflecting the previous comment.

Ryusuke Konishi

