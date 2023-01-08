Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D8FE5661A44
	for <lists+cluster-devel@lfdr.de>; Sun,  8 Jan 2023 22:59:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673215165;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=CRwtLPQVjsAJ21UOF2AH7QhDRVRLxvztJgAiY0hGtps=;
	b=KhqwDHrY85TzXISc53RW814NHZEd7zlvJRjxoH5qLbpJgnof1Zsqf+66HS409NdPJCKpjo
	Cit+CpgLyFxnc/C+A9wOxScp49m0MDwTe4xeFoQIJ2Kom8r6HLoJEJUBZVde1c80kw33v2
	vgU2PM4fZ0YXtPurAkOAtJR9uAvskCo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-46-TR3Svau1NtmUdhpFwCh8dw-1; Sun, 08 Jan 2023 16:59:21 -0500
X-MC-Unique: TR3Svau1NtmUdhpFwCh8dw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EEA6D1875041;
	Sun,  8 Jan 2023 21:59:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C24B640C2064;
	Sun,  8 Jan 2023 21:59:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A2E4F1947062;
	Sun,  8 Jan 2023 21:59:20 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E0CE31946586 for <cluster-devel@listman.corp.redhat.com>;
 Sun,  8 Jan 2023 21:59:19 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6D37642222; Sun,  8 Jan 2023 21:59:19 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 647C642203
 for <cluster-devel@redhat.com>; Sun,  8 Jan 2023 21:59:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4504F85C064
 for <cluster-devel@redhat.com>; Sun,  8 Jan 2023 21:59:19 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-216-4_Tob7iDOrWMLJgkVq49Sg-1; Sun, 08 Jan 2023 16:59:17 -0500
X-MC-Unique: 4_Tob7iDOrWMLJgkVq49Sg-1
Received: by mail-pl1-f172.google.com with SMTP id jn22so7519873plb.13
 for <cluster-devel@redhat.com>; Sun, 08 Jan 2023 13:59:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CRwtLPQVjsAJ21UOF2AH7QhDRVRLxvztJgAiY0hGtps=;
 b=izqJ7ZnZO7CP5jWAJuW2KLwiZe3k/l62fnFrvbt1T4FR5Jkqs7tRomKkIDJoOiayD1
 a2wbH7HR/ml9+WdZpL2QG1XTyMZXzCqyNpOPRsk4zp3LiHprYZ/or18XZ/QZczlGVGwH
 nowpve0eCT9EZAM9F+9882mYum8Xw/3kBK7K/nI01UGSp/1zGL8tMh8cEsBiT/r95r1c
 inptCtoXvuIIa+rMoM09jxoilMOtNvmBYlKkZf1UTTxe6p+i5Zs2ymUNMUuuYvp1QT0F
 +sPzxA7SaPY5TfXP1JH7vEgSOqSApaMhEUjCLtCJ9qhhyXUqteuaB8GU6Fvv5EFBHItE
 4ftg==
X-Gm-Message-State: AFqh2kpW2UGyeVfXzAha5opAMjDpZMm0hM6JNEZ7Xr6inyS4ilfH+0Tn
 VT7MINSjqxV8wmnlZprCZeoszw==
X-Google-Smtp-Source: AMrXdXsAIiWjmygk2jewqgV/cdCOSCNGl0lDa8UBdYidyZcmWqor2Pq9z7XkwyQwco4bwJjylZIz9g==
X-Received: by 2002:a17:90a:aa92:b0:226:b425:3540 with SMTP id
 l18-20020a17090aaa9200b00226b4253540mr16679445pjq.36.1673215156237; 
 Sun, 08 Jan 2023 13:59:16 -0800 (PST)
Received: from dread.disaster.area (pa49-186-146-207.pa.vic.optusnet.com.au.
 [49.186.146.207]) by smtp.gmail.com with ESMTPSA id
 jx12-20020a17090b46cc00b00225a8024b8bsm4127825pjb.55.2023.01.08.13.59.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 13:59:15 -0800 (PST)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
 (envelope-from <david@fromorbit.com>)
 id 1pEdh9-000l2I-TM; Mon, 09 Jan 2023 08:59:11 +1100
Date: Mon, 9 Jan 2023 08:59:11 +1100
From: Dave Chinner <david@fromorbit.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <20230108215911.GP1971568@dread.disaster.area>
References: <20230108194034.1444764-1-agruenba@redhat.com>
 <20230108194034.1444764-9-agruenba@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20230108194034.1444764-9-agruenba@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: Re: [Cluster-devel] [RFC v6 08/10] iomap/xfs: Eliminate the
 iomap_valid handler
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
Cc: linux-xfs@vger.kernel.org, cluster-devel@redhat.com,
 "Darrick J . Wong" <djwong@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jan 08, 2023 at 08:40:32PM +0100, Andreas Gruenbacher wrote:
> Eliminate the ->iomap_valid() handler by switching to a ->get_folio()
> handler and validating the mapping there.
> 
> Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>

I think this is wrong.

The ->iomap_valid() function handles a fundamental architectural
issue with cached iomaps: the iomap can become stale at any time
whilst it is in use by the iomap core code.

The current problem it solves in the iomap_write_begin() path has to
do with writeback and memory reclaim races over unwritten extents,
but the general case is that we must be able to check the iomap
at any point in time to assess it's validity.

Indeed, we also have this same "iomap valid check" functionality in the
writeback code as cached iomaps can become stale due to racing
writeback, truncated, etc. But you wouldn't know it by looking at the iomap
writeback code - this is currently hidden by XFS by embedding
the checks into the iomap writeback ->map_blocks function.

That is, the first thing that xfs_map_blocks() does is check if the
cached iomap is valid, and if it is valid it returns immediately and
the iomap writeback code uses it without question.

The reason that this is embedded like this is that the iomap did not
have a validity cookie field in it, and so the validity information
was wrapped around the outside of the iomap_writepage_ctx and the
filesystem has to decode it from that private wrapping structure.

However, the validity information iin the structure wrapper is
indentical to the iomap validity cookie, and so the direction I've
been working towards is to replace this implicit, hidden cached
iomap validity check with an explicit ->iomap_valid call and then
only call ->map_blocks if the validity check fails (or is not
implemented).

I want to use the same code for all the iomap validity checks in all
the iomap core code - this is an iomap issue, the conditions where
we need to check for iomap validity are different for depending on
the iomap context being run, and the checks are not necessarily
dependent on first having locked a folio.

Yes, the validity cookie needs to be decoded by the filesystem, but
that does not dictate where the validity checking needs to be done
by the iomap core.

Hence I think removing ->iomap_valid is a big step backwards for the
iomap core code - the iomap core needs to be able to formally verify
the iomap is valid at any point in time, not just at the point in
time a folio in the page cache has been locked...

-Dave.
-- 
Dave Chinner
david@fromorbit.com

